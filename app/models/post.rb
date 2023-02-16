class Post < ApplicationRecord
    belongs_to :user
    validates_presence_of :title, :body
    has_rich_text :body
    serialize :images, JSON
    has_many :images
    belongs_to :category
    belongs_to :type
    has_many_attached :images
    has_many :image_data
    has_many :convo, dependent: :destroy
    has_many_attached :allimages
end
