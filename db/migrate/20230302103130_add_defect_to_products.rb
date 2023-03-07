class AddDefectToProducts < ActiveRecord::Migration[7.0]
  # This will add new column named defected with default value as true
  def change
    add_column :products, :defected, :boolean, default: true
  end
end
