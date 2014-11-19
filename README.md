# Youtube and Vimeo thumbnails

Get the thumbnails from Youtube and Vimeo videos for Ruby.

And it may support more video hoster with your [contributions](#contributing).

## Installation

Add it to your Gemfile:

```ruby
gem 'video_thumb'
```

and run on terminal:

    $ bundle

or install the gem on terminal.

    $ gem install video_thumb

## Parameters

**url**

> Youtube or Vimeo video link
> http://www.youtube.com/watch?v=iEPTlhBmwRg
> or
> http://vimeo.com/101419884

**size**
> **default**  *= large*
> **small**  *(Youtube: 120x90, Vimeo: 100x75)*
> **medium**  *(Youtube: 320x180, Vimeo: 200x150)*
> **large**  *(Youtube: 640x480, Vimeo: 640xauto)*
> **max**  *(Youtube: original, Vimeo: 640xauto)*



## Usage

```ruby
require 'video_thumb'
VideoThumb::get("http://vimeo.com/101419884")
# returns large thumbnail from Vimeo video
# http://i.vimeocdn.com/video/483188148_640.jpg

VideoThumb::get("http://www.youtube.com/watch?v=iEPTlhBmwRg", "medium")
# returns medium thumbnail from Youtube video
# https://img.youtube.com/vi/iEPTlhBmwRg/mqdefault.jpg
```


**Rails 4**
```ruby
VideoThumb::get("http://vimeo.com/101419884")
# returns large thumbnail from Vimeo video
# http://i.vimeocdn.com/video/483188148_640.jpg

VideoThumb::get("http://www.youtube.com/watch?v=iEPTlhBmwRg", "medium")
# returns medium thumbnail from Youtube video
# https://img.youtube.com/vi/iEPTlhBmwRg/mqdefault.jpg
```

## Dependencies
 - open-uri
 - json


## Contributing
<a name="contributing"></a>
1. Fork it ( https://github.com/tgezginis/video_thumb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
