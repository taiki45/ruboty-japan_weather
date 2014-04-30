module Ellen
  module Handlers
    class JapanWeather < Base
      on /.*の天気/, name: "japan_weather", description: "Reply weather forecast"

      def japan_weather(message)
        Ellen::Actions::JapanWeather.new(message).call
      end
    end
  end
end
