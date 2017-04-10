class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body
      t.references :user, null: false

      t.timestamps null: false
    end

    add_foreign_key :posts, :users, column: :user_id
  end
end
