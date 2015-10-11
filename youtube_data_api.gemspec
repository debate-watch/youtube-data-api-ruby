# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'youtube_data_api/version'

Gem::Specification.new do |spec|
  spec.name          = "youtube_data_api"
  spec.version       = YoutubeDataApi::VERSION
  spec.authors       = ["MJ Rossetti (@s2t2)"]
  spec.email         = ["s2t2mail+git@gmail.com"]

  spec.summary       = %q{A ruby library for parsing data from the YouTube Data API.}
  spec.description   = %q{A ruby library for parsing data from the YouTube Data API. Parses channel, playlist, and video data.}
  spec.homepage      = "https://github.com/debate-watch/youtube-data-api-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "redcarpet"
  spec.add_development_dependency "github-markup"
  spec.add_dependency "google-api-client"
end
