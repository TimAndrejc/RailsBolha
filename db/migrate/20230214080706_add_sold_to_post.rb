class AddSoldToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :sold, :boolean
  end
end
