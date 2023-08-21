require 'video_thumb/version'

require 'nokogiri'
require 'open-uri'
require 'json'
require 'uri'
require 'net/http'

module VideoThumb
  class << self
    def get(url, size = 'large')
      # size_parameter = { 'small', 'medium', 'large', 'max'}

      # youtube
      #   default: small - 120x90
      #   mqdefault: medium - 320x180
      #   hqdefault: high - 480x360
      #   sddefault: 640x480
      #   maxresdefault: original

      # vimeo
      #   thumbnail_small: 100x75
      #   thumbnail_medium: 200x150
      #   thumbnail_large: 640xauto

      case size
      when 'small'
        youtube_size  = 'default'
        vimeo_size    = 'thumbnail_small'
      when 'medium'
        youtube_size  = 'mqdefault'
        vimeo_size    = 'thumbnail_medium'
      when 'large'
        youtube_size  = 'sddefault'
        vimeo_size    = 'thumbnail_large'
      when 'max'
        youtube_size  = 'maxresdefault'
        vimeo_size    = 'thumbnail_large'
      else
        youtube_size  = 'sddefault'
        vimeo_size    = 'thumbnail_large'
      end

      if url.include?('youtu.be') || url.include?('youtube')
        regex = /(https?:\/\/)?(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?[A-Za-z0-9_=-]+&v=)([A-Za-z0-9_-]*)(\&\S+)?(\?\S+)?/
        url.gsub(regex) do
          youtube_video_id = Regexp.last_match(4)
          image = "https://img.youtube.com/vi/#{youtube_video_id}/#{youtube_size}.jpg"
          return image
        end
      elsif url.include?('vimeo')
        regex = /^https?:\/\/(?:.*?)\.?(vimeo)\.com\/(\d+).*$/
        url = get_redirect_url(url) unless regex.match?(url)
        url.gsub(regex) do
          vimeo_video_id = Regexp.last_match(2)
          vimeo_video_json_url = format('https://vimeo.com/api/v2/video/%s.json', vimeo_video_id)
          image = begin
                    JSON.parse(URI.open(vimeo_video_json_url).read).first[vimeo_size]
                  rescue StandardError
                    nil
                  end
          return image
        end
      elsif url.include?('izlesene')
        image = Nokogiri::HTML(URI.open(url)).css("meta[property='og:image']").at_css('meta[property="og:image"]')['content']
        return image
      else
        return false
      end
    end

    private

    def get_redirect_url(url)
      parsed_url = URI(url)
      http = Net::HTTP.new(parsed_url.host, parsed_url.port)
      http.use_ssl = true
      location = http.get(parsed_url.path).header['location']
      "#{parsed_url.scheme}://#{parsed_url.host}#{location}"
    end
  end
end
