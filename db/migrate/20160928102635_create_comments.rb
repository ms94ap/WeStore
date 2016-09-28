class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :commenter
      t.integer :user_id
      t.integer :post_id
      t.datetime :time_created
    end
  end
end
