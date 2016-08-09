class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :score
      t.integer :seller_id
      t.integer :buyer_id

      t.timestamps null: false
    end
  end
end
