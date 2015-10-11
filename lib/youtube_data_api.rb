require 'google/api_client'

require "youtube_data_api/version"

module YoutubeDataApi

  #def self.parse(response)
  #  raise "EXPECTING A GOOGLE API CLIENT RESPONSE" unless response.is_a?(Google::APIClient::Result)
  #  result = JSON.parse(response.data.to_json)
  #end

  #
  # CHANNELS
  #

  CHANNEL_URL_PREFIX = "https://www.youtube.com/channel/"
  USER_URL_PREFIX = "https://www.youtube.com/user/"
  CHANNEL_PARTS = "id, contentDetails, contentOwnerDetails, snippet, statistics"

  def self.channel_request_params(channel_url, options)
    request_params = {
      :part => options[:request_parts] || CHANNEL_PARTS,
      :pageToken => options[:page_token]
    }
    if channel_url.include?(CHANNEL_URL_PREFIX)
      request_params.merge!({
        :id => channel_url.gsub(CHANNEL_URL_PREFIX,'')
      })
    elsif channel_url.include?(USER_URL_PREFIX)
      request_params.merge!({
        :forUsername => channel_url.gsub(USER_URL_PREFIX,'')
      })
    else
      raise ChannelUrlError.new("could not recognize the channel_url #{channel_url}. try a url that contains either #{CHANNEL_URL_PREFIX} or #{USER_URL_PREFIX} ...")
    end
    return request_params
  end

  class ChannelUrlError ; end

  # Get channel (user).
  #
  # @param [String] channel_url "https://www.youtube.com/user/CSPAN"
  # @param [Hash] options
  # @param [Hash] options [String] api_key
  # @param [Hash] options [String] app_name
  # @param [Hash] options [String] app_version
  # @param [Hash] options [String] app_version
  # @param [Hash] options [String] request_parts A comma separated string of response parts which you would like to request. Limit api usage by only requesting the parts you need.
  # @param [Hash] options [String] page_token
  #
  # @example YoutubeDataApi.channel("https://www.youtube.com/user/CSPAN")
  #
  def self.channel(channel_url, options = {})

    # Initialize new Google API Client.

    client = Google::APIClient.new(
      :key => options[:api_key] || ENV['YOUTUBE_DATA_API_KEY'] || "my-key-123",
      :application_name => options[:app_name] || "my-app",
      :application_version => options[:app_version] || "0.0.1"
    )
    client.authorization = nil
    youtube_api = client.discovered_api('youtube', 'v3')

    # Request a response from the Google API Client.

    response = client.execute(
      :api_method => youtube_api.channels.list,
      :parameters => self.channel_request_params(channel_url, options)
    ) #> Google::APIClient::Result

    # Parse response.

    result = JSON.parse(response.data.to_json) #> [{}]
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















  #
  # PLAYLISTS
  #

  #PLAYLIST_ITEM_PARTS = "id, contentDetails, snippet, status"

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

  #
  # VIDEOS
  #

  #VIDEO_PARTS = "id, contentDetails, liveStreamingDetails, player, recordingDetails, snippet, statistics, status, topicDetails"
  #VIDEO_PRIVATE_PARTS = "fileDetails, processingDetails, suggestions" # :-) can't request these unless authenticated

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
