class Position < ActiveRecord::Base
  belongs_to :container
  belongs_to :place

  validates :container_id, :presence => true
  validates :place_id, :presence => true
end
