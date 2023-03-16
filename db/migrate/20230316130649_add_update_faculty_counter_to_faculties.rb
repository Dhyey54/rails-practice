class AddUpdateFacultyCounterToFaculties < ActiveRecord::Migration[7.0]
  def change
    add_column :faculties, :update_faculty_count, :integer, default: 0
  end
end
