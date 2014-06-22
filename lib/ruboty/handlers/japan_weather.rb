module Ruboty
  module Handlers
    class JapanWeather < Base
      on /.*の天気/, name: "japan_weather", description: "Reply weather forecast"

      def japan_weather(message)
        Ruboty::Actions::JapanWeather.new(message).call
      end
    end
  end
end
