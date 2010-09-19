# Musix Match

 _
| |       _
| |      | |
| | _  _ | |
| || || || |  MusixMatch is wrapper for the [musixmatch.com](http://musixmatch.com, MusixMatch) API's.
| || || || |  With this library you can search for lyrics and tracks
| |  || || |  using the [musixmatch.com](http://musixmatch.com "MusixMatch") service.
|          |
|          |  Author: Andrea Franz [gravityblast.com](http://gravityblast.com)
\          /
 ----------
 
## Installation

    gem install musix_match    

## Usage

    require 'musix_match'
    
    MusixMatch::API::Base.api_key = 'YOUR_API_KEY'

### Lyrics search

    response = MusixMatch.search_lyrics(:q_artist => 'Pantera')
    if response.status_code == 200
      response.each do |lyrics|
        puts "#{lyrics.lyrics_id}: #{lyrics.track_name} (#{lyrics.artist_name})"
      end
    end
    
Available options for the search_lyrics methods are:

* q: string to be searched in every data field
* q_track: string to be searched among tracks titles
* q_artist: string to be searched among artists names
* format: desired output format
* page: requested page of results
* page_size: desired number of items per result page
    
### Getting lyrics

    response = MusixMatch.get_lyrics(lyrics_id)
    if response.status_code == 200 && lyrics = response.lyrics
      puts lyrics.lyrics_body
    end

### Track search

    response = MusixMatch.search_track(:q_artist => 'Pantera')
    if response.status_code == 200
      response.each do |track|
        puts "#{track.track_id}: #{track.track_name} (#{track.artist_name})"
      end
    end
    
### Getting track

    response = MusixMatch.get_track(track_id)
    if response.status_code == 200 && track = response.track
      puts "#{track.track_name} (#{track.artist_name})"
      puts "Lyrics id: #{track.lyrics_id}"
    end
    
## Lyrics

The Lyrics object has the following attributes:

* lyrics_id
* lyrics_body
* track_name
* artist_name

## Track

The track object has the following attributes:

* track_id
* track_mbid
* lyrics_id
* track_name
* artist_id
* artist_mbid
* artist_name

