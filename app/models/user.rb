class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes
  has_many :favorites

  def fav_recipes
    Recipe.find(Favorite.where(user_id: self.id).collect(&:recipe_id))
  end
end
