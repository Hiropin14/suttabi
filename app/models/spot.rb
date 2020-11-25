class Spot < ApplicationRecord
    belongs_to :user, optional: true
    validates :image, :about, :address, presence: true
    mount_uploader :image, ImageUploader
    
    default_scope -> { order(created_at: :desc) }
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    

    
end
