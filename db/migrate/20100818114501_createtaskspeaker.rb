class Createtaskspeaker < ActiveRecord::Migration
  def self.up
     create_table :talkspeakers do |t|
      t.references :speaker
      t.references :room
     end
  end

  def self.down
  end
end
