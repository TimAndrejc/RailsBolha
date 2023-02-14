class AddConfirmedToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :confirmed, :boolean
  end
end
