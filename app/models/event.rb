class Event < ApplicationRecord
  belongs_to :category
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
  has_many :comments
end
