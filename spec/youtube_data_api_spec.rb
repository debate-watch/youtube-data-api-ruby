require 'spec_helper'

describe YoutubeDataApi do
  it 'has a version number' do
    expect(YoutubeDataApi::VERSION).not_to be nil
  end

  context 'given a valid channel_url' do
    let(:channel_url){"https://www.youtube.com/user/CSPAN"}

    it 'parses a channel' do
      data = YoutubeDataApi.channel(channel_url)
      #expect(data).to be_kind_of(Hash)
      expect(data["kind"]).to eql("youtube#channelListResponse")
      #expect(data["etag"]).to be_kind_of(String)
      #expect(data["pageInfo"]).to be_kind_of(Hash)
      #expect(data["pageInfo"]["totalResults"]).to be_greater_or_equal_to(0)
      #expect(data["pageInfo"]["resultsPerPage"]).to be_greater_or_equal_to(0)
      #expect(data["items"]).to be_kind_of(Array)
      expect(data["items"].first["kind"]).to eql("youtube#channel")
    end

    it 'parses channel playlists' do
      data = YoutubeDataApi.channel_playlists(channel_url)
      expect(data).to be_kind_of(Array)
    end
  end

  context 'given a valid playlist_url' do
    let(:playlist_url){"https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ"}

    it 'parses a playlist' do
      data = YoutubeDataApi.playlist(playlist_url)
      expect(data).to be_kind_of(Hash)
    end

    it 'parses playlist items' do
      data = YoutubeDataApi.playlist_items(playlist_url)
      expect(data).to be_kind_of(Array)
    end
  end

  context 'given a valid video_url' do
    let(:video_url){"https://www.youtube.com/watch?v=oBM7DIeMsP0"}

    it 'parses a video' do
      data = YoutubeDataApi.video(video_url)
      expect(data).to be_kind_of(Hash)
    end
  end
end
