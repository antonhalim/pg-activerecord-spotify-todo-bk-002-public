require 'pry'
class DataLoader

  attr_reader :data

  def initialize(url)
    @data = load_json(url)
  end

  def load_json(url)
    JSON.load(open(url))
  end

  def extract_tracks
    data["tracks"]
  end

  def add_song_to_db(track)
    song = Song.new(
    :track_name => track["track_name"],
    :artist => track["artist_name"],
    :album => track["album_name"],
    :url => track["track_url"],
    :num_streams =>track["num_streams"] )
    song.save
  end

  def add_songs_to_db
    songs = extract_tracks
    songs.each do |song|
      add_song_to_db(song)
    end
  end

end
