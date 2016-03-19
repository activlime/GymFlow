class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update,:destroy]
  before_action :find_program, only: [:show, :edit, :update,:destroy]

  def new
    @program = Program.find(params[:program_id])
    @workout = @program.workouts.build
  end

  def create
    @program = Program.find(params[:program_id])
    @workout = @program.workouts.create(workout_params)

    redirect_to program_path(@program)
  end

  def show
    @exercises = Exercise.where(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit(:name)
  end

  def find_workout
    @workout = Workout.find(params[:id])
  end

  def find_program
    @program = Program.find(params[:program_id])
  end
end
