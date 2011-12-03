class FixUserNameInPortfolio < ActiveRecord::Migration
  def change
    rename_column :portfolios, :user_id, :admin_id
  end
end
