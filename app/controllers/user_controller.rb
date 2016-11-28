class UserController < ApplicationController
  before_action :authenticate_user!

  def favorite
    recipe = Recipe.find(fav_params['id'])

    if recipe
      current_user.favorites.create(recipe_id: recipe.id)
    end
  end

  def remove_favorite
    f = Favorite.find_by(user_id: current_user.id, recipe_id: fav_params['id'])
    if f
      f.destroy
    end
  end

  private

  def fav_params
    params.permit(:id)
  end

end
