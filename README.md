# YoutubeDataApi

A ruby library interface to the [YouTube Data API](https://developers.google.com/youtube/v3/docs/). Parses channel, playlist, and video data.

## Installation

```` rb
gem install youtube_data_api
````

Or install with bundler
 by adding `gem youtube_data_api` to your application's Gemfile
 before performing a `bundle install`.

## Usage

Parse Youtube data.

```` rb

# CHANNELS

channel_url = "https://www.youtube.com/user/CSPAN"
YoutubeDataApi.channel(channel_url)
YoutubeDataApi.channel_playlists(channel_url)

# PLAYLISTS

playlist_url = "https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ"
YoutubeDataApi.playlist(playlist_url)
YoutubeDataApi.playlist_items(playlist_url)

# VIDEOS

video_url = "https://www.youtube.com/watch?v=oBM7DIeMsP0"
YoutubeDataApi.video(video_url)
````

### Prerequisites

#### YouTube-API-enabled Application

Create a new application in the [google developer console](https://console.developers.google.com), and note its name. Navigate to the **APIs & Auth > APIs** menu and enable the *YouTube Data API v3* by searching for it. Refer to the
 [YouTube API Application Registration Guide](https://developers.google.com/youtube/registering_an_application)
for more support.

#### Youtube API Key

Navigate to the **APIs & Auth > Credentials** menu and add credentials for an API Key, specifically, a **Server Key**. Note the value of your API Key. Refer to the [YouTube API Key Generation Guide](https://developers.google.com/youtube/registering_an_application#Create_API_Keys)
for more support.

### Configuration

Configure the library
 to make requests on behalf of your YouTube API Key
 by
   assigning it to an environment variable or
   passing it as a request parameter.

#### Environment Variable

If using the environment variable configuration approach,
 add a variable called `YOUTUBE_DATA_API_KEY` to your **.bash_profile**:

```` sh
export YOUTUBE_DATA_API_KEY="my-key-123"
````

#### Request Parameter

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
