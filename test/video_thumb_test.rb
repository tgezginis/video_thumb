require 'minitest/autorun'
require 'video_thumb'

class VideoThumbTest < Minitest::Test
  def test_youtube_video
    assert_equal 'https://img.youtube.com/vi/iEPTlhBmwRg/mqdefault.jpg', VideoThumb.get('http://www.youtube.com/watch?v=iEPTlhBmwRg', 'medium')
  end

  def test_vimeo_video
    assert_equal 'http://i.vimeocdn.com/video/483188148_640.jpg', VideoThumb.get('http://vimeo.com/101419884')
  end

  def test_secure_vimeo_video
    assert_equal 'http://i.vimeocdn.com/video/483188148_640.jpg', VideoThumb.get('https://vimeo.com/101419884')
  end

  def test_aliased_vimeo_video
    assert_equal 'http://i.vimeocdn.com/video/699818221_640.jpg', VideoThumb.get('https://vimeo.com/madeinyuhara/watasinoinaihoshi')
  end

  def test_reversed_url_params
    assert_equal 'https://img.youtube.com/vi/9BOuRUlRKzA/sddefault.jpg', VideoThumb.get('https://www.youtube.com/watch?time_continue=3&v=9BOuRUlRKzA')
  end
end
