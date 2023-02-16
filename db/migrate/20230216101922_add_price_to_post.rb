class AddPriceToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :price, :float
  end
end
