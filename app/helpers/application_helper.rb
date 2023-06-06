module ApplicationHelper
  def customer_fullname(customer)
    customer.first_name + customer.last_name
  end
end
