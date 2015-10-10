require "youtube_data_api/version"

module YoutubeDataApi

  # Get channel (user).
  #
  # @param [String] channel_url "https://www.youtube.com/user/CSPAN"
  #
  # @example YoutubeDataApi.channel("https://www.youtube.com/user/CSPAN")
  #
  def self.channel(channel_url)
    puts channel_url
    return {}
  end

  # List channel playlists.
  #
  # @param [String] channel_url "https://www.youtube.com/user/CSPAN"
  #
  # @example YoutubeDataApi.channel_playlists("https://www.youtube.com/user/CSPAN")
  #
  def self.channel_playlists(channel_url)
    puts channel_url
    return []
  end

  # Get playlist.
  #
  # @param [String] playlist_url "https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ"
  #
  # @example YoutubeDataApi.playlist("https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ")
  #
  def self.playlist(playlist_url)
    puts playlist_url
    return {}
  end

  # List playlist items (videos).
  #
  # @param [String] playlist_url "https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ"
  #
  # @example YoutubeDataApi.playlist_items("https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ")
  #
  def self.playlist_items(playlist_url)
    puts playlist_url
    return []
  end

  # Get video.
  #
  # @param [String] video_url "https://www.youtube.com/watch?v=oBM7DIeMsP0"
  #
  # @example YoutubeDataApi.video("https://www.youtube.com/watch?v=oBM7DIeMsP0")
  #
  def self.video(video_url)
    puts video_url
    return {}
  end
end
