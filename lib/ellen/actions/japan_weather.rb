module Ruboty
  module Actions
    class JapanWeather < Base
      def call
        message.reply(forecast)
      end

      private

      def forecast
        look_for(message.body).to_s
      end

      def look_for(body)
        WeatherJp.parse(body)
      rescue WeatherJp::WeatherJpError => e
        "Error: #{e}"
      end
    end
  end
end
