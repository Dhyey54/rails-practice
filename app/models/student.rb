class DateValidator < ActiveModel::Validator
  def validate(record)
    if record.birthdate.present? && record.birthdate > Date.today
      record.errors.add :birthdate, "Enter Proper Date of birth"
    end
  end
end

class DepartmentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    (value.upcase == "CE" || value.upcase == "IT") ? true : (record.errors.add :department, "Department can't be #{value}")
  end
end

class Student < ApplicationRecord
  validates :first_name, :last_name, presence: { message: "%{attribute} must be given please" }
  validates :terms_of_usage, acceptance: { message: 'Terms of usage must be accepted to continue' }
  validates :department, presence: true, department: true
  validates_with DateValidator
end
