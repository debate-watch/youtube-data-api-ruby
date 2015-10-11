require 'google/api_client'

require "youtube_data_api/version"

# todo: refactor!

module YoutubeDataApi

  def self.initialize_service(options)
    client = Google::APIClient.new(
      :key => options[:api_key] || ENV['YOUTUBE_DATA_API_KEY'] || "my-key-123",
      :application_name => options[:app_name] || "my-app",
      :application_version => options[:app_version] || "0.0.1"
    )
    client.authorization = nil
    youtube_api = client.discovered_api('youtube', 'v3')
    return client, youtube_api
  end














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
      request_params.merge!({:id => channel_url.gsub(CHANNEL_URL_PREFIX,'')})
    elsif channel_url.include?(USER_URL_PREFIX)
      request_params.merge!({:forUsername => channel_url.gsub(USER_URL_PREFIX,'')})
    else
      raise ChannelUrlError.new("could not recognize the channel_url #{channel_url}. try a url that contains either #{CHANNEL_URL_PREFIX} or #{USER_URL_PREFIX} ...")
    end
    return request_params
  end

  class ChannelUrlError ; end

  # Get channel (user).
  #
  # @param [String] channel_url "https://www.youtube.com/user/CSPAN" The url representing a specific youtube channel or user.
  # @param [Hash] options
  # @param [Hash] options [String] api_key
  # @param [Hash] options [String] app_name
  # @param [Hash] options [String] app_version
  # @param [Hash] options [String] request_parts A comma separated string of response parts which you would like to request. Limit api usage by only requesting the parts you need.
  # @param [Hash] options [String] page_token
  #
  # @example YoutubeDataApi.channel("https://www.youtube.com/user/CSPAN")
  #
  def self.channel(channel_url, options = {})
    client, youtube_api = self.initialize_service(options)
    response = client.execute(
      :api_method => youtube_api.channels.list,
      :parameters => self.channel_request_params(channel_url, options)
    )
    result = JSON.parse(response.data.to_json)
  end

  PLAYLIST_PARTS = "id, contentDetails, player, snippet, status"

  def self.channel_id(channel_url)
    channel_response = self.channel(channel_url)
    channel_response["items"].first["id"]
  end

  def self.channel_playlists_request_params(channel_url, options)
    {
      :part => options[:request_parts] || PLAYLIST_PARTS,
      :pageToken => options[:page_token],
      :channelId => self.channel_id(channel_url) #todo: obviate this call if channel_id param is present...
    }
  end

  # List channel playlists.
  #
  # @param [String] channel_url "https://www.youtube.com/user/CSPAN" The url representing a specific youtube channel or user.
  # @param [Hash] options
  # @param [Hash] options [String] api_key
  # @param [Hash] options [String] app_name
  # @param [Hash] options [String] app_version
  # @param [Hash] options [String] request_parts A comma separated string of response parts which you would like to request. Limit api usage by only requesting the parts you need.
  # @param [Hash] options [String] page_token
  #
  # @example YoutubeDataApi.channel_playlists("https://www.youtube.com/user/CSPAN")
  #
  def self.channel_playlists(channel_url, options = {})
    client, youtube_api = self.initialize_service(options)
    response = client.execute(
      :api_method => youtube_api.playlists.list,
      :parameters => self.channel_playlists_request_params(channel_url, options)
    )
    result = JSON.parse(response.data.to_json)
  end















  #
  # PLAYLISTS
  #

  PLAYLIST_URL_PREFIX = "https://www.youtube.com/playlist?list="

  def self.playlist_id(playlist_url)
    playlist_url.gsub(PLAYLIST_URL_PREFIX,'')
  end

  def self.playlist_request_params(playlist_url, options)
    {
      :part => options[:part] || PLAYLIST_PARTS,
      :pageToken => options[:page_token],
      :id => self.playlist_id(playlist_url) #todo: obviate this call if playlist_id param is present...,
    }
  end

  # Get playlist.
  #
  # @param [String] playlist_url "https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ" The url representing a specific youtube playlist.
  # @param [Hash] options
  # @param [Hash] options [String] api_key
  # @param [Hash] options [String] app_name
  # @param [Hash] options [String] app_version
  # @param [Hash] options [String] request_parts A comma separated string of response parts which you would like to request. Limit api usage by only requesting the parts you need.
  # @param [Hash] options [String] page_token
  #
  # @example YoutubeDataApi.playlist("https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ")
  #
  def self.playlist(playlist_url, options = {})
    client, youtube_api = self.initialize_service(options)
    response = client.execute(
      :api_method => youtube_api.playlists.list,
      :parameters => self.playlist_request_params(playlist_url, options)
    )
    result = JSON.parse(response.data.to_json)
  end

  PLAYLIST_ITEM_PARTS = "id, contentDetails, snippet, status"

  def self.playlist_items_request_params(playlist_url, options)
    {
      :part => options[:part] || PLAYLIST_ITEM_PARTS,
      :pageToken => options[:page_token],
      :playlistId => self.playlist_id(playlist_url) #todo: obviate this call if playlist_id param is present...,
    }
  end

  # List playlist items (videos).
  #
  # @param [String] playlist_url "https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ" The url representing a specific youtube playlist.
  # @param [Hash] options
  # @param [Hash] options [String] api_key
  # @param [Hash] options [String] app_name
  # @param [Hash] options [String] app_version
  # @param [Hash] options [String] request_parts A comma separated string of response parts which you would like to request. Limit api usage by only requesting the parts you need.
  # @param [Hash] options [String] page_token
  #
  # @example YoutubeDataApi.playlist_items("https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ")
  #
  def self.playlist_items(playlist_url, options = {})
    client, youtube_api = self.initialize_service(options)
    response = client.execute(
      :api_method => youtube_api.playlist_items.list,
      :parameters => self.playlist_items_request_params(playlist_url, options)
    )
    result = JSON.parse(response.data.to_json)
  end
























  #
  # VIDEOS
  #

  #VIDEO_PARTS = "id, contentDetails, liveStreamingDetails, player, recordingDetails, snippet, statistics, status, topicDetails"
  #VIDEO_PRIVATE_PARTS = "fileDetails, processingDetails, suggestions" # :-) can't request these unless authenticated

  # Get video.
  #
  # @param [String] video_url "https://www.youtube.com/watch?v=oBM7DIeMsP0" The url representing a specific youtube video.
  # @param [Hash] options
  # @param [Hash] options [String] api_key
  # @param [Hash] options [String] app_name
  # @param [Hash] options [String] app_version
  # @param [Hash] options [String] request_parts A comma separated string of response parts which you would like to request. Limit api usage by only requesting the parts you need.
  # @param [Hash] options [String] page_token
  #
  # @example YoutubeDataApi.video("https://www.youtube.com/watch?v=oBM7DIeMsP0")
  #
  def self.video(video_url, options = {})
    puts video_url
    return {}
  end
end
