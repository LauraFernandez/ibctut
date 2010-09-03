class Room < ActiveRecord::Base
validates_presence_of :name, :description,:capacity
has_many :talks

 def get_capacity
    capacity
  end
end
