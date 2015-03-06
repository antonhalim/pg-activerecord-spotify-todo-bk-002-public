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
  end
  
  def add_song_to_db(track)
    # code second
  end
  
  def add_songs_to_db
    # code third
  end

end