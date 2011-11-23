class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :container_id
      t.integer :place_id

      t.timestamps
    end
  end
end
