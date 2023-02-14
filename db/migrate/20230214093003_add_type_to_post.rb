class AddTypeToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :type, null: false, foreign_key: true
  end
end
