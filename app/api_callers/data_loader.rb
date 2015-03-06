class DataLoader

  attr_reader :data

  def initialize(url)
    @data = load_json(url)
  end

  def load_json(url)
    JSON.load(open(url))
  end

  def extract_tracks
    # code first
    self.data["tracks"]
  end

  def extract_values(track)
    {
      :url => track["track_url"], 
      :track_name => track["track_name"], 
      :artist => track["artist_name"], 
      :num_streams => track["num_streams"], 
      :album => track["album_name"]
    }
  end
  
  def add_song_to_db(track)
    # code second
    Song.create(extract_values(track))
  end
  
  def add_songs_to_db
    # code third
    self.extract_tracks.each do |track|
      add_song_to_db(track)
    end
  end

end