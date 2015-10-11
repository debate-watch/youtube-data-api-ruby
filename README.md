# YoutubeDataApi

A ruby library for parsing data from the [YouTube Data API](https://developers.google.com/youtube/v3/docs/). Parses channels, playlists, and videos.

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

#
# CHANNELS
#

channel_url = "https://www.youtube.com/user/CSPAN"

# /channel/:id

channel_data = YoutubeDataApi.channel(channel_url)

# /channel/:id/playlists

playlists_data = YoutubeDataApi::channel_playlists(channel_url)

#
# PLAYLISTS
#

playlist_url = "https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ"

# /playlist/:id

playlist_data = YoutubeDataApi.playlist(playlist_url)

# /playlist/:id/items

playlist_items_data = YoutubeDataApi::playlist_items(playlist_url)

#
# VIDEOS
#

video_url = "https://www.youtube.com/watch?v=oBM7DIeMsP0"

# /video/:id

video_data = YoutubeDataApi.video(video_url)
````

### Prerequisites

#### Youtube-API-enabled Application

Create a new application in the [google developer console](https://console.developers.google.com), and note its name.

Navigate to the **APIs & Auth > APIs** menu and enable the *YouTube Data API v3* by searching for it.

Refer to the
 [YouTube API Application Registration Guide](https://developers.google.com/youtube/registering_an_application)
for more support.

#### Youtube API Key

Navigate to the **APIs & Auth > Credentials** menu and add credentials for an API Key, specifically, a **Server Key**.

Note the value of your API Key.

Refer to the [YouTube API Key Generation Guide](https://developers.google.com/youtube/registering_an_application#Create_API_Keys)
for more support.

### Configuration

Configure the library to make requests on behalf of your YouTube API Key by either assigning it to an environment variable called `YOUTUBE_DATA_API_KEY` or passing it as a request parameter called `:api_key`.

#### Environment Variable

If using the environment variable approach, add the YouTube API Key to your **.bash_profile**:

```` sh
export YOUTUBE_DATA_API_KEY="my-key-123"
````

#### Request Parameter

Alternatively, you may use the request parameter approach:

```` rb
channel_url = "https://www.youtube.com/user/CSPAN"
options = {:api_key => "my-key-123"}
channel_data = YoutubeDataApi.channel(channel_url, options)
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Browse existing [issues](https://github.com/data-creative/youtube-data-api-ruby/issues) or create a new issue to communicate bugs, desired features, etc.

After forking the repo and pushing your changes, create a pull request referencing the applicable issue(s).

### Developing

After checking out the repo, run `bin/setup` to install dependencies.

### Testing

Run `rake rspec` or `bundle exec rspec spec/` to run the tests.

Optionally run `bin/console` for an interactive prompt that will allow you to experiment.

FYI - the tests expect you to use the [environment variable approach](#environment-variable) when specifying your YouTube API Key.

### Releasing

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## [License](LICENSE.txt)
