class Post < ApplicationRecord
    belongs_to :user
    validates_presence_of :title, :body
    has_rich_text :body
    has_many :comments, dependent: :destroy
end
