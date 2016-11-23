class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :filename
      t.string :ext
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
