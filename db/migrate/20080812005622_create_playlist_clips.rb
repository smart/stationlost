class CreatePlaylistClips < ActiveRecord::Migration
  def self.up
    create_table :playlist_clips do |t|
      t.integer :playlist_id, :clip_id
      t.timestamps
    end
  end

  def self.down
    drop_table :playlist_clips
  end
end
