class AuthorsController < ApplicationController
  def index
    @authors = Author.all.order(:id)
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(article_params)

    if @author.save
      redirect_to @author
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(article_params)
      redirect_to @author
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def article_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birth, :email)
  end
end
