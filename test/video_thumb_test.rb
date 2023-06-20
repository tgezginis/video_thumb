require 'minitest/autorun'
require 'video_thumb'

class VideoThumbTest < Minitest::Test
  def test_youtube_video
    assert_equal 'https://img.youtube.com/vi/iEPTlhBmwRg/mqdefault.jpg', VideoThumb.get('http://www.youtube.com/watch?v=iEPTlhBmwRg', 'medium')
  end

  def test_vimeo_video
    assert_equal 'http://i.vimeocdn.com/video/483188148-c2e6e58357c4d88f05c53949868a19ff76d7237f71f48947dd0b28276ab3d61b-d_640', VideoThumb.get('http://vimeo.com/101419884')
  end

  def test_secure_vimeo_video
    assert_equal 'http://i.vimeocdn.com/video/483188148-c2e6e58357c4d88f05c53949868a19ff76d7237f71f48947dd0b28276ab3d61b-d_640', VideoThumb.get('https://vimeo.com/101419884')
  end

  def test_aliased_vimeo_video
    assert_equal 'http://i.vimeocdn.com/video/699818221-17cfe596d47c3751e58295209cb575361fc964f385b9be553834b19345dcae4a-d_640', VideoThumb.get('https://vimeo.com/madeinyuhara/watasinoinaihoshi')
  end

  def test_reversed_url_params
    assert_equal 'https://img.youtube.com/vi/9BOuRUlRKzA/sddefault.jpg', VideoThumb.get('https://www.youtube.com/watch?time_continue=3&v=9BOuRUlRKzA')
  end
end
