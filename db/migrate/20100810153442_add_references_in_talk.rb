class AddReferencesInTalk < ActiveRecord::Migration
  def self.up
   
    add_column :talks,:room_id,:integer
    add_column :talks,:speaker_id,:integer
    remove_column :talks, :url

  end

  def self.down
  end
end
