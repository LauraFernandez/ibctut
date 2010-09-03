class EditTalksAddEvent < ActiveRecord::Migration
  def self.up
     add_column :talks,:event_id,:integer
  end

  def self.down
  end
end
