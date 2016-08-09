class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :minimum_quantity
      t.float :price #check for various currencies

      t.timestamps null: false
    end
  end
end
