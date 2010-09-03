class Event < ActiveRecord::Base
  validates_presence_of :name, :description,:address
  has_many :talks
  acts_as_commentable
  #has_many :comments
end
