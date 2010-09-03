class Editspeaker < ActiveRecord::Migration
  def self.up
    add_column :speakers,:talk_id,:integer
  end

  def self.down
  end
end
