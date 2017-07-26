class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    session["secret_cookie"] = 'hello world'
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
