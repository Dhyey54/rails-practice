class FixBooksPrice < ActiveRecord::Migration[7.0]
  def change
    reversible do |rev|
      change_table :books do |t|
        rev.up { t.change :price, :decimal, precision: 6, scale: 1 }
        rev.down { t.change :price, :decimal, precision: 5, scale: 2 }
      end
    end
  end
end
