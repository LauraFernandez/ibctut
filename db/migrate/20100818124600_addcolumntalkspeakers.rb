class Addcolumntalkspeakers < ActiveRecord::Migration
  def self.up
    add_column :talk_speakers,:talk_id,  :integer
  end

  def self.down
  end
end
