class ExercisesController < ApplicationController
  before_action :find_workout, only: [:show, :edit, :update,:destroy]
  before_action :find_exercise, only: [:show, :edit, :update,:destroy]

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new
  end

  private
  def workout_params
    params.require(:workout).permit(:name)
  end

  def find_workout
    @workout = Workout.find(params[:workout_id])
  end

  def find_exercise
    @exercise = Exercise.find(params[:id])
  end
end
