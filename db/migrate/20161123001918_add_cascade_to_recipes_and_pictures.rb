class AddCascadeToRecipesAndPictures < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :recipes, :users
    remove_foreign_key :pictures, :recipes

    add_foreign_key :recipes, :users, on_delete: :cascade
    add_foreign_key :pictures, :recipes, on_delete: :cascade

    # or in the upcoming native support in Rails 4.2
    # add_foreign_key :posts, :users, on_delete: :cascade
  end
end
