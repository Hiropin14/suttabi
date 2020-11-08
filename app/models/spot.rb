class Spot < ApplicationRecord
    belongs_to :user, optional: true
    mount_uploader :image, ImageUploader

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    has_many :favorites, dependent: :destroy

    has_many :comments, dependent: :destroy
    
end
