class Post < ApplicationRecord
    belongs_to :user
    validates_presence_of :title, :body
    has_rich_text :body
    has_many :comments, dependent: :destroy
    mount_uploaders :images, ImageUploader
    serialize :images, JSON
    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images

end
