class DepartmentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    (value.upcase == "CE" || value.upcase == "IT") ? true : (record.errors.add :department, "Department can't be #{value}")
  end
end
