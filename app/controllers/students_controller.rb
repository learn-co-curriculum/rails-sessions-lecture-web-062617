class StudentsController < ApplicationController
  before_action :authorize_user, only: [:show, :new]

  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if !@student.save
      render :new
    else
      redirect_to students_path
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :dob)
  end

end
