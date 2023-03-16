class DateValidator < ActiveModel::Validator
  def validate(record)
    if record.birthdate.present? && record.birthdate > Date.today
      record.errors.add :birthdate, "Enter Proper Date of birth"
    end
  end
end
