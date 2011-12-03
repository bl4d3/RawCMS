class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :admin
  
  validates :title, :presence => true
  validates :description, :presence => true
  validates :short_description, :presence => true
  validates :admin_id, :presence => true
  
end
