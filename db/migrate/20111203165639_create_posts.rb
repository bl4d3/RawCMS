class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :short_description
      t.text :description
      t.boolean :is_public
      t.integer :category_id
      t.integer :user_id
      t.string :tag_keyword
      t.text :text_description

      t.timestamps
    end
  end
end
