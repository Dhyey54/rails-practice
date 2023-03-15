class ChangeAuthorsDob < ActiveRecord::Migration[7.0]
  def up
    rename_column :authors, :dob, :date_of_birth
  end

  def down
    rename_column :authors, :date_of_birth, :dob
  end

  # def change
  #   reversible do |rev|
  #     change_table :authors do |t|
  #       rev.up { t.rename :dob, :date_of_birth }
  #       rev.down { t.rename :date_of_birth, :dob }
  #     end
  #   end
  # end
end
