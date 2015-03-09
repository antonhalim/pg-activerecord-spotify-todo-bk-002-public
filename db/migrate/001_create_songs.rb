class CreateSongs < ActiveRecord::Migration

  def change
    create_table :songs do |t|
      t.string :track_name, :artist, :album, :url
      t.integer :num_streams
    end
  end
end
