# YoutubeDataReader

A ruby library for parsing data from the [YouTube Data API](https://developers.google.com/youtube/v3/docs/). Parses channels, playlists, and videos.

## Installation

```` sh
gem install youtube_data_reader
````

Or install with bundler
 by adding `gem youtube_data_reader` to your application's Gemfile
 before performing a `bundle install`.

## Usage

Parse Youtube data.

```` rb

#
# Parse channel data.
#

channel_url = "https://www.youtube.com/user/CSPAN"
channel_data = YoutubeDataReader.channel(channel_url)
playlists_data = YoutubeDataReader::playlists(channel_url)

#
# Parse playlist data.
#

playlist_url = "https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ"
playlist_data = YoutubeDataReader.playlist(playlist_url)
playlist_items_data = YoutubeDataReader::playlist_items(playlist_url)

#
# Parse video data.
#

video_url = "https://www.youtube.com/watch?v=oBM7DIeMsP0"
YoutubeDataReader.video(video_url)
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Browse existing [issues](https://github.com/data-creative/youtube-data-reader-ruby/issues) or create a new issue to communicate bugs, desired features, etc.

After forking the repo and pushing your changes, create a pull request referencing the applicable issue(s).

### Developing

After checking out the repo, run `bin/setup` to install dependencies.

### Testing

Run `rake rspec` or `bundle exec rspec spec/` to run the tests.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### Releasing

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## [License](LICENSE.txt)
