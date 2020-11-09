class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
 
  has_many :spots, dependent: :destroy


  has_many :likes, dependent: :destroy
  has_many :liked_spots, through: :likes, source: :spot

  has_many :favorites, dependent: :destroy 
  
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 
  mount_uploader :image, ImageUploader

  def already_liked?(spot)
    self.likes.exists?(spot_id: spot.id)
  end

 


end
