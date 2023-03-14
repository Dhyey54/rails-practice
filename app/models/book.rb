class Book < ApplicationRecord
  belongs_to :author
  validates :name, length: { minimum:5 }
  validates :price, numericality: true
end
