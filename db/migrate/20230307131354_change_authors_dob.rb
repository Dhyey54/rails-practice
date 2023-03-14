class ChangeAuthorsDob < ActiveRecord::Migration[7.0]
  def change
    reversible do |rev|
      change_table :authors do |t|
        rev.up { t.rename :dob, :date_of_birth }
        rev.down { t.rename :date_of_birth, :dob }
      end
    end
  end
end
