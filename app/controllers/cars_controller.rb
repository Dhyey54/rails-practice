class CarsController < ApplicationController
  USERS = { 'dhyey' => 'pass', 'krutik' => 'abc'}

  before_action :authenticate
  before_action :require_login
  before_action :admin_login, only: [:new, :edit, :destroy]

  def index
    @cars = Car.all.order(id: :asc)
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
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
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to @car
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
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

  def require_login
    current_user
    if is_logged?
      puts "require"
      flash[:error] = "You must be logged in to get access"
      redirect_to users_path
    end
  end

  def admin_login
    unless is_logged?
      puts "admin"
      if @current_user[:username] != "admin"
        flash[:error] = "Only admins can modify the data"
        redirect_to cars_path
      end
    end
  end

  def is_logged?
    current_user == nil
  end

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
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
