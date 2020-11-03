class User < ApplicationRecord
  has_many :spots, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_spots, through: :likes, source: :spot
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 


  def already_liked?(spot)
    self.likes.exists?(spot_id: spot.id)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
