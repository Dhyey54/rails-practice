class Customer < ApplicationRecord
  has_many :orders
  has_many :commodities, through: :orders
  
  validates :email, uniqueness: true
  validates :first_name, :last_name, :phone_number, presence: true
  validates :phone_number, uniqueness: { case_sensitive: false }, length: {is: 10}
end
