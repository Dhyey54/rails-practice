class AddEmailToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :email, :string
    add_column :students, :update_student_count, :integer, default: 0
  end
end
