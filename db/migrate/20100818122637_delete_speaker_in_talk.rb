class DeleteSpeakerInTalk < ActiveRecord::Migration
  def self.up
     remove_column :talks,:speaker_id,  :integer
  end

  def self.down
  end
end
