class Student < ApplicationRecord
  include ActiveModel::Validations

  validates :first_name, :last_name, presence: { message: "%{attribute} must be given please" }
  validates :department, presence: true, department: true
  validates :terms_of_usage, acceptance: { message: 'Terms of usage must be accepted to continue' }
  validates_with DateValidator
end
