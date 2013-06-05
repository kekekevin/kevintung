class Slot < ActiveRecord::Base

  attr_accessible :name, :start_time, :end_time

  has_and_belongs_to_many :performers

end
