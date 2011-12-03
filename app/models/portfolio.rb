class Portfolio < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  validates :skill, :presence => true
  validates :admin_id, :presence => true
end
