class Speaker < ActiveRecord::Base
  validates_presence_of :name, :description
  has_many :talkSpeakers
  has_many :talks, :through =>:talkSpeakers
end
