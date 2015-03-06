---
tags: sql, introductory, insert, todo
languages: sql, ruby
resources: 0
---

# SQL Spotify Songs

## Quick Note

This lab will add a table the spotify database go ahead and create that database now:

```
> createdb spotify_with_activerecord
```

## Instructions

#### Create `Song` class

This class will live in your models and shouldn't be more than two lines of code. Remember to inherit from ActiveRecord!

#### Create `songs` table

The table `songs` has not been created. You need to create it. It should look something like this:

|column|type|
|------|----|
|id    |integer|
|track_name|text|
|artist|text|
|album|text|
|url|text|
|num_streams|integer|

Remember, migrations belong in your `db/migrate` folder.

#### Finish `DataLoader` class

Your job is to add every song that is in Spotify's top charts for this week to the `songs` table. Take a look at that JSON [here](http://charts.spotify.com/api/tracks/most_streamed/us/weekly/latest). This JSON has already been opened and loaded and saved as `@data`.

What you need to do is to iterate through every song in `@data` and add it to the database with the correct track name, artist, album, url, and number of streams.

Go ahead and open `lib/data_loader.rb`. You'll be adding code to these methods in this order:

1. `#extract_tracks`
2. `#add_song_to_db`
3. `#add_songs_to_db`

## Resources

* [Spotify US Charts Weekly Latest](http://charts.spotify.com/api/tracks/most_streamed/us/weekly/latest)
