class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable 
  has_many :likes, dependent: :destroy
  has_many :liked_pets, through: :likes, source: :pet
  has_many :pets
  has_many :comments, dependent: :destroy
  def already_liked?(pet)
    self.likes.exists?(pet_id: pet.id)
  end
end
