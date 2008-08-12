class CreateClips < ActiveRecord::Migration
  def self.up
    create_table :clips do |t|
      t.integer :episode_id, :season_id, :size, :position
      t.string :filename, :content_type, :length => 255
      t.timestamps
    end
  end

  def self.down
    drop_table :clips
  end
end
