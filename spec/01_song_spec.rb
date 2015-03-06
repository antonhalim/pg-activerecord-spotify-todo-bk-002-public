describe Song do
  let(:attributes) { ["track_name", "artist", "album", "url"] }
  let(:attribute_hash) { 
    {
      :track_name => "Crazy In Love",
      :artist => "Beyoncé",
      :album => "Dangerously in Love",
      :url => "http://youtu.be/ViwtNLUqkMY"
    }
  }
  before(:each) do
    @song = Song.new
  end

  it "has a table with the correct column names" do
    columns = Song.column_names
    all_attributes = attributes + ["num_streams", "id"]
    all_attributes.each do |attribute|
      expect(columns).to include(attribute)
    end
  end 

  it "has a track name, artist, album, and url" do
    attribute_hash.each do |method, value|
      expect { @song.send("#{method.to_s}=", value) }.to_not raise_error
      @song.send("#{method.to_s}=", value)
      expect(@song.send(method)).to eq(value)
    end
  end

  it "has a num_streams" do
    num = 15000
    expect { @song.num_streams = num }.to_not raise_error
    @song.num_streams = num
    expect(@song.num_streams).to eq(num)
  end

  it "has an id once saved" do
    @song.track_name = "Crazy In Love"
    @song.save
    found_song = Song.find_by(:track_name => "Crazy In Love")
    expect(found_song.id).to_not be_nil
  end

end