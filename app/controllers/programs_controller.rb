class ProgramsController < ApplicationController
  before_action :find_program, only: [:show, :edit, :update,:destroy]
  before_action :find_workouts, only: [:show, :edit, :update,:destroy]
  before_action :find_exercises, only: [:show, :edit, :update,:destroy]

  def index
    @programs = Program.all
  end

  def show
  end

  def new
    @program = current_user.programs.build
  end

  def create
    @program = current_user.programs.build(program_params)

    if @program.save
      redirect_to new_program_workout_path(@program)
    else
      render 'new'
    end
  end

  def update
    if @program.update(program_params)
      redirect_to @program, notice: "Pin was successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @exercises.destroy_all
    @workouts.destroy_all
    @program.destroy

    redirect_to root_path
  end

  private

  def program_params
    params.require(:program).permit(:title, :description)
  end

  def find_program
    @program = Program.find(params[:id])
  end

  def find_workouts
    @workouts = Workout.where(params[:program_id])
  end

  def find_exercises
    @exercises = Array.new
    for workout in @workouts
      @exercises += workout.exercises
    end
  end
end
