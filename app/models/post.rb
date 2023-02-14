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
    after_save :save_image_data
    has_many :convo, dependent: :destroy
    def save_image_data
      if images.present?
        images.each do |image|
          if image.attached?
            image_data.create(data: image.download)
          end
        end
      end
      
    end
end
