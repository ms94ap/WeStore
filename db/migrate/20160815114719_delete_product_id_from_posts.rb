class DeleteProductIdFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :product_id
  end
end
