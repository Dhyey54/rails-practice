class Commodity < ApplicationRecord
  has_many :orders
  has_many :customers, through: :orders

  enum :status, ['In Stock', 'Out of Stock', 'Coming Soon']
  default_scope { where(is_active: true) }

  validates :title, :description, :price, :status, presence: true
end
