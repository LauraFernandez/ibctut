class EditRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms,:talk_id,:integer
  end

  def self.down
  end
end
