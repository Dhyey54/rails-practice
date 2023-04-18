class OrdersController < ApplicationController
  before_action :order_details, only: %i[edit update show destroy]
  before_action :customer_details
  before_action :commodity_details

  def index
    @orders = Order.order(:id)
  end

  def show
    @customer = @order.customer
  end

  def search
    commodity_ids = Commodity.where("title LIKE ?", params[:search_product] + "%").pluck(:id)
    @orders = Order.where(commodity_id: commodity_ids)

    render :index
  end

  def filtered_orders
    case params[:task]
    when ""
      flash[:notice] = "Please Select Option"
      @orders = Order.order(:id)
    when "1"
      @orders = Order.where("quantity > 12")
    when "2"
      @orders = Order.order(total_price: :desc)
    when "3"
      @orders = Order.order(:quantity)
    when "4"
      @orders = Order.where("total_price > ?", 5000)
    when "5"
      @orders = Order.order(:status)
    when "6"
      @orders = Order.where(status: 0)
    end
    render :index
  end

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
