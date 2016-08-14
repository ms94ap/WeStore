class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :description
      t.integer :product_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
