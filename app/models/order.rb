class Order < ApplicationRecord
  belongs_to :commodity, -> { unscope(:where) }
  belongs_to :customer

  before_save :total_price_order

  enum :status, ["Booked", "Canceled"]

  OPTIONS = [["Quantity Filter", 1], 
  ["Sort by total price", 2], 
  ["Sort by quantity", 3], 
  ["Total Price Filter", 4],
  ["Sort by Status", 5],
  ["Status Filter", 6],
  ].freeze

  validates :quantity, :status, :commodity_id, :customer_id, presence: true

  private
  def total_price_order
    self.total_price = quantity * commodity.price
  end
end
