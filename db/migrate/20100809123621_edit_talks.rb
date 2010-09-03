class EditTalks < ActiveRecord::Migration
  def self.up
    remove_column :talks,:speaker_id,  :integer
    remove_column :talks,:room_id,:integer
    add_column :talks, :event_id,:integer
  end

  def self.down
  end
end
