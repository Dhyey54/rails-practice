class CustomersController < ApplicationController
  before_action :customer_details, only: %i[edit update show destroy]

  def index
    @customers = Customer.order(:id)
  end

  def show; end

  def top_customers
    case params[:task]
    when ''
      flash[:alert] = 'No Access'
      redirect_to customers_path
    when '1'
      @customers = Customer.joins(:orders).group(:id).order('SUM(quantity) DESC').limit(3)
    when '2'
      @customers = Customer.joins(orders: :commodity).group(:id).order('SUM(price) DESC').limit(3)
    when '3'
      @customers = Customer.joins(:orders).where("orders.status = '0'").order('COUNT(customers.id) DESC').group(:id).limit(5)
    when '4'
      @customers = Customer.joins(:orders).where("orders.status = '1'").order('COUNT(customers.id) DESC').group(:id).limit(5)
    end
  end

  def new
    @customer = Customer.new
  end

  def edit; end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy

    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone_number)
  end

  def customer_details
    @customer = Customer.find(params[:id])
  end
end
