class Changetalkspeakers < ActiveRecord::Migration
  def self.up
      remove_column :talk_speakers,:room_id,  :integer
      remove_column :talk_speakers,:talk_id,  :integer
  end

  def self.down
  end
end
