class CarsController < ApplicationController
  USERS = { 'dhyey' => 'pass', 'krutik' => 'abc'}

  before_action :authenticate
  before_action :admin_login, only: [:new, :edit, :destroy]
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all.order(id: :asc)
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy

    redirect_to cars_path, status: :see_other
  end

  def search
    @cars = Car.where("name LIKE ?", "%" + params[:search_car] + "%").order(id: :asc)
  end

  def download_pdf
    @user = current_user
    send_data generate_pdf(@user), filename: "#{@user.username}.pdf", type: 'application/pdf'
  end

  private
  def car_params
    params.require(:car).permit(:name, :constructor, :price)
  end

  def admin_login
    unless is_logged?
      if @current_user[:username] != "admin"
        flash[:error] = "Only admins can modify the data"
        redirect_to cars_path
      end
    end
  end

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

  def find_car
    @car = Car.find(params[:id])
  end

  def generate_pdf(user)
    @cars = Car.all
    pdf = Prawn::Document.new
    pdf.text("Hello #{@user.username.titleize}", align: :center)
    table_data = Array.new
    table_data << ["Name","Type","Price"]
    @cars.each do |p|
      table_data << [p.name, p.constructor, p.price]
    end
    pdf.table(table_data, width: 400, position: :center, cell_style: { inline_format: true, background_color: "ccffff" })
    pdf.render
  end

end
