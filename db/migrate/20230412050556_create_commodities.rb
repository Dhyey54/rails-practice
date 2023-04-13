class CreateCommodities < ActiveRecord::Migration[7.0]
  def change
    create_table :commodities do |t|
      t.string :title
      t.string :description
      t.bigint :price
      t.integer :capacity
      t.boolean :is_active
      t.integer :status

      t.timestamps
    end
  end
end
