# YoutubeDataApi

A ruby library interface to the [YouTube Data API](https://developers.google.com/youtube/v3/docs/). Parses channel, playlist, and video data.

## Installation

```` rb
gem install youtube_data_api
````

If using bundler:
 add `gem 'youtube_data_api', '~> 3.0'` to the Gemfile,
 then run `bundle install`.

## Usage

### API Requests

#### Get Channel

```` rb
channel_url = "https://www.youtube.com/user/CSPAN"
YoutubeDataApi.channel(channel_url)
````

#### List Playlists for a given Channel

```` rb
channel_url = "https://www.youtube.com/user/CSPAN"
YoutubeDataApi.channel_playlists(channel_url)
````

#### Get Playlist

```` rb

playlist_url = "https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ"
YoutubeDataApi.playlist(playlist_url)
````

#### List Playlist Items (Videos)

```` rb
playlist_url = "https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ"
YoutubeDataApi.playlist_items(playlist_url)
````

#### Get Video

```` rb
video_url = "https://www.youtube.com/watch?v=oBM7DIeMsP0"
YoutubeDataApi.video(video_url)
````

### Pagination

You may need to paginate through responses.

```` rb
channel_url = "https://www.youtube.com/user/CSPAN"
response = YoutubeDataApi.channel_playlists(channel_url)
while response do
  puts response["pageInfo"]

  if response["nextPageToken"]
    request_params = {:page_token => response["nextPageToken"]}
    response = YoutubeDataApi.channel_playlists(channel_url, request_params)
  else
    response = nil
  end
end
````

## Prerequisites

### YouTube-API-enabled Application

Create a new application in the [google developer console](https://console.developers.google.com), and note its name. Navigate to the **APIs & Auth > APIs** menu and enable the *YouTube Data API v3* by searching for it. Refer to the
 [YouTube API Application Registration Guide](https://developers.google.com/youtube/registering_an_application)
for more support.

### Youtube API Key

Navigate to the **APIs & Auth > Credentials** menu and add credentials for an API Key, specifically, a **Server Key**. Note the value of your API Key. Refer to the [YouTube API Key Generation Guide](https://developers.google.com/youtube/registering_an_application#Create_API_Keys)
for more support.

## Configuration

Make requests on behalf of your YouTube API-enabled Application
  by using an environment variable approach or
  a request parameter approach to specifying your API Key.

### Environment Variable

If using the environment variable configuration approach,
 add a variable called `YOUTUBE_DATA_API_KEY` to your **.bash_profile**:

```` sh
export YOUTUBE_DATA_API_KEY="my-key-123"
````

### Request Parameter

If using the request parameter configuration approach, pass the `:api_key` parameter to any request:

```` rb
channel_url = "https://www.youtube.com/user/CSPAN"
options = {:api_key => "my-key-123"}
YoutubeDataApi.channel(channel_url, options)
````

## Contributing

Browse existing [issues](https://github.com/debate-watch/youtube-data-api-ruby/issues) or create a new issue to communicate bugs, desired features, etc.
 After forking the repo and pushing your changes, create a pull request referencing the applicable issue(s).

### Developing

After checking out the repo, run `bin/setup` to install dependencies.

### Testing

Run `rake rspec` or `bundle exec rspec spec/` to run the tests.
 Optionally run `bin/console` for an interactive prompt that will allow you to experiment.

NOTE: tests expect you to specify your YouTube API Key using the [environment variable configuration approach](#environment-variable).

### Releasing

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

When bumping the gem version,
 please keep the major version number in sync with
 the YouTube API version (currently **v3**).

## [License](LICENSE.txt)
