class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :name
      t.string :sub_title
      t.string :place_holder
      t.text :description
      t.integer :parent_id
      t.boolean :is_public
      t.integer :order_show
      t.string :template
      t.string :mtitle
      t.string :mkey
      t.text :mdescription
      t.string :slug

      t.timestamps
    end
  end
end
