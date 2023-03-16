class Faculty < ApplicationRecord
  include ActiveModel::Validations

  validates :first_name, :last_name, presence: { message: "%{attribute} must be given please" }
  validates_with DateValidator
  validates :designation, exclusion: { in: ["HOD", "Sr. Prof."], message: "HOD or Sr. Prof. as value is not allowed" },
    inclusion: { in: ["Ass. Prof.", "Prof."], message: "%{value} for %{attribute} is not allowed. Designation can only be Ass. Prof. or Prof." },
    presence: true
  
  with_options presence: true do
    validates :email, uniqueness: true
    validates :phone_number, numericality: { only_integer: true }, length: { is: 10 }
  end

end