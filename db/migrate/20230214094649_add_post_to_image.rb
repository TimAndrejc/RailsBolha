class AddPostToImage < ActiveRecord::Migration[7.0]
  def change
    add_reference :images, :post, null: false, foreign_key: true
  end
end
