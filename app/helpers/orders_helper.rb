module OrdersHelper
  def commodity_name(id)
    Commodity.unscoped.find(id)
  end
end
