class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :name
      t.text :description
      t.string :skill
      t.integer :order_show
      t.integer :user_id
      t.boolean :is_public
      t.string :link

      t.timestamps
    end
  end
end
