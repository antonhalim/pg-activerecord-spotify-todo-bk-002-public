# create your songs migration here
# remember to inherit from activerecord migration

class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :track_name
      t.string :artist
      t.string :url
      t.string :album
      t.integer :num_streams
    end
  end
end