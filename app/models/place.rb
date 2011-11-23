class Place < ActiveRecord::Base
  has_many :positions
  has_many :containers, :through => :positions

  validates :name, :presence => true
  validates :alias, :presence => true
end
