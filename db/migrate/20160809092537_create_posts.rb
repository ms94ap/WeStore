class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
