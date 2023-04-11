class Employee < ApplicationRecord
  validates :first_name, :last_name, :email, :age, :salary, presence: true

  OPTIONS = @options = [
    ["Age Task", 1], 
    ["Availability Task", 2], 
    ["Order and Age Task", 3], 
    ["Date Task", 4], 
    ["Order and Age Task 2", 5], 
    ["Sort by Age", 6], 
    ["Sort by No Of Order", 7], 
    ["Salary Task", 8], 
    ["Group Employee Task", 9],
    ["Unscope and Only Task", 10],
    ["Reorder and Reverse Order Task", 11]
].freeze
end
