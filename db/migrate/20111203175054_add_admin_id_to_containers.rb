class AddAdminIdToContainers < ActiveRecord::Migration
  def change
    add_column :containers, :admin_id, :integer
  end
end
