class AppController < ApplicationController

  def index
    @recipes = Recipe.all.order(updated_at: :desc)
  end

  def search
    @recipes = Recipe.where("title ILIKE '%#{params['term']}%'").order(updated_at: :desc)
    render 'index'
  end

end
