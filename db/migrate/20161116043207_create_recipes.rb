class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :cooking_time
      t.integer :prep_time
      t.integer :servings
      t.text :ingredients
      t.text :directions
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
