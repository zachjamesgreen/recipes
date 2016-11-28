class CreateComments < ActiveRecord::Migration[5.0]

  def up
    execute <<-SQL
      CREATE TYPE comment_status AS ENUM ('approved', 'denied', 'pending');
    SQL
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true
      t.text :comment
      t.column :status, :comment_status
      t.integer :rating

      t.timestamps
    end
  end

  # NOTE: It's important to drop table before dropping enum.
  def down
    drop_table :comments

    execute <<-SQL
      DROP TYPE comment_status;
    SQL
  end
  
end
