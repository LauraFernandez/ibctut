class Talk < ActiveRecord::Base
  validates_presence_of :title, :description
  has_many :talkSpeakers
  has_many :speakers, :through =>:talkSpeakers
  belongs_to :room
  belongs_to :event

  acts_as_commentable
end
