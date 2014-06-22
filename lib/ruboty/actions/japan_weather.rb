module Ruboty
  module Actions
    class JapanWeather < Base
      def call
        message.reply(forecast)
      end

      private

      def forecast
        if captures = cmd?(message.match_data.captures)
          look_by_cmd(*captures).to_s
        elsif body = jp?(message.match_data.captures)
          look_by_jp(body).to_s
        else
          message.reply('Unmatched...')
        end
      end

      def look_by_cmd(place, day)
        WeatherJp.get(place, convert(day))
      rescue WeatherJp::WeatherJpError => e
        "Error: #{e}"
      end

      def look_by_jp(body)
        WeatherJp.parse(body)
      rescue WeatherJp::WeatherJpError => e
        "Error: #{e}"
      end

      def cmd?(captures)
        captures[1..2] if captures[1] && captures[2]
      end

      def jp?(captures)
        captures.first if captures.first
      end

      def convert(day)
        case day
        when /今日|きょう|今|いま/u
          :today
        when /明日|あした/u
          :tomorrow
        when /明後日|あさって/u
          :day_after_tomorrow
        else
          day
        end
      end
    end
  end
end
