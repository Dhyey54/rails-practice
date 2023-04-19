class OrdersController < ApplicationController
  before_action :order_details, only: %i[edit update show destroy]
  before_action :customer_details
  before_action :commodity_details

  def index
    @orders = Order.order(:id)
  end

  def show; end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy

    redirect_to orders_path
  end

  private
  
  def order_params
    params.require(:order).permit(:quantity, :total_price, :status, :commodity_id, :customer_id)
  end

  def order_details
    @order = Order.find(params[:id])
  end

  def customer_details
    @customers = Customer.select(:id, :first_name, :last_name)
  end

  def commodity_details
    @commodities = Commodity.select(:id, :title)
  end
end
