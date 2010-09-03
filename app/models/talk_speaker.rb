class TalkSpeaker < ActiveRecord::Base
  belongs_to :talk
  belongs_to :speaker
end
