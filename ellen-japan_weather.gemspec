# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ellen/japan_weather/version'

Gem::Specification.new do |spec|
  spec.name          = "ellen-japan_weather"
  spec.version       = Ellen::JapanWeather::VERSION
  spec.authors       = ["Taiki ONO"]
  spec.email         = ["taiks.4559@gmail.com"]
  spec.summary       = %q{Weather forecast action for ellen bot framework.}
  spec.description   = %q{An action to tell weather forecast for ellen bot framework.}
  spec.homepage      = "https://github.com/taiki45/ellen-japan_weather"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ellen"
  spec.add_dependency "weather_jp"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
