class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/, message: "Enter proper email address"}, uniqueness: true

  validates_date :date_of_birth, presence: true, on_or_before: -> { Date.current }, message: "Enter proper date of birth"
end
