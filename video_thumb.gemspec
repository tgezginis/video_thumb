# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'video_thumb/version'

Gem::Specification.new do |spec|
  spec.name          = "video_thumb"
  spec.version       = VideoThumb::VERSION
  spec.authors       = ["Tolga Gezginiş"]
  spec.email         = ["tolga@gezginis.com"]
  spec.summary       = %q{Youtube, Vimeo and İzlesene thumbnails}
  spec.description   = %q{Get the thumbnails from Youtube, Vimeo and İzlesene videos}
  spec.homepage      = "https://github.com/tgezginis/video_thumb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "json"
  spec.add_runtime_dependency "nokogiri"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
