class Post < ApplicationRecord
    belongs_to :user
    validates_presence_of :title, :body
    has_rich_text :body
    has_many :comments, dependent: :destroy
    mount_uploaders :images, ImageUploader
    serialize :images, JSON
    has_many :images, dependent: :destroy
    belongs_to :category
    belongs_to :type
    has_many_attached :images
    has_many :image_data, dependent: :destroy
    has_many :convo, dependent: :destroy
    has_many_attached :allimages
    def self.search(query)
      where("title LIKE ?", "%#{query}%")
    end
end
