class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.belongs_to :user
      t.integer :parent_id
      t.timestamps
    end
  end
end
