class AddPostIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :post_id, :integer
  end
end
