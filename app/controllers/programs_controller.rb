class ProgramsController < ApplicationController
  before_action :find_program, only: [:show, :edit, :update,:destroy]

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
      redirect_to @program, notice: "Successfully created new Program"
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
end
