class CreateTalks < ActiveRecord::Migration
  def self.up
    create_table :talks do |t|
      t.string :title
      t.string :description
      t.string :url
      t.references :speaker
      t.references :room
      t.timestamps
    end
  end

  def self.down
    drop_table :talks
  end
end
