class FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all.order(id: :asc)
  end

  def show
    @faculty = Faculty.find(params[:id])
  end

  def new
    @faculty = Faculty.new
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def create
    @faculty = Faculty.new(author_params)

    if @faculty.save
      redirect_to @faculty
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @faculty = Faculty.find(params[:id])

    if @faculty.update(author_params)
      redirect_to @faculty
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy

    redirect_to faculties_path, status: :see_other
  end

  private
  def author_params
    params.require(:faculty).permit(:first_name, :last_name, :birthdate, :email, :phone_number, :designation)
  end
end
