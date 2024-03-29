class StudentsController < ApplicationController
  def index
    @students = Student.all.order(id: :asc)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    @student.department.upcase!

    if @student.save
      flash.alert = "Email Validated"
      redirect_to @student
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @student = Student.find(params[:id])
    student_params[:department].upcase!

    if @student.update(student_params)
      flash.alert = "Email Validated"
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path, status: :see_other
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :birthdate, :department, :terms_of_usage, :student_count)
  end
end
