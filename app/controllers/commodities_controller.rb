class CommoditiesController < ApplicationController
  before_action :unscoped_commodity, only: %i[edit update show destroy]

  def index
    @commodities = Commodity.unscoped.order(:id)
  end

  def home
    @commodities = Commodity.order(:id)
    render :index
  end

  def show
    @orders = @commodity.orders.includes(:customer)
  end

  def new
    @commodity = Commodity.new
  end

  def edit; end

  def create
    @commodity = Commodity.new(commodity_params)

    if @commodity.save
      redirect_to @commodity
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @commodity.update(commodity_params)
      redirect_to @commodity
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @commodity.destroy

    redirect_to commodities_path, status: :see_other
  end

  private

  def commodity_params
    params.require(:commodity).permit(:title, :description, :price, :capacity, :is_active, :status)
  end

  def unscoped_commodity
    @commodity = Commodity.unscoped.find(params[:id])
  end
end
