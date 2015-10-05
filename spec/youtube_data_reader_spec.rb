require 'spec_helper'

describe YoutubeDataReader do
  it 'has a version number' do
    expect(YoutubeDataReader::VERSION).not_to be nil
  end

  context 'given a valid channel_url' do
    let(:channel_url){"https://www.youtube.com/user/CSPAN"}

    it 'parses a channel' do
      data = YoutubeDataReader.channel(channel_url)
      expect(data).to be_kind_of(Hash)
    end

    it 'parses channel playlists' do
      data = YoutubeDataReader.channel_playlists(channel_url)
      expect(data).to be_kind_of(Array)
    end
  end

  context 'given a valid playlist_url' do
    let(:playlist_url){"https://www.youtube.com/playlist?list=PLf0o4wbW8SXqTSo6iJkolKCKJYBnpo9NZ"}

    it 'parses a playlist' do
      data = YoutubeDataReader.playlist(playlist_url)
      expect(data).to be_kind_of(Hash)
    end

    it 'parses playlist items' do
      data = YoutubeDataReader.playlist_items(playlist_url)
      expect(data).to be_kind_of(Array)
    end
  end

  context 'given a valid video_url' do
    let(:video_url){"https://www.youtube.com/watch?v=oBM7DIeMsP0"}

    it 'parses a video' do
      data = YoutubeDataReader.video(video_url)
      expect(data).to be_kind_of(Hash)
    end
  end
end
