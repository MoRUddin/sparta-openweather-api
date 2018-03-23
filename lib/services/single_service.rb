require "json"
require "httparty"

class SingleService
  attr_reader :weather_result
  include HTTParty

  base_uri 'http://api.openweathermap.org/data/2.5/weather?id='

    def query_id(country_string)
      @weather_result = JSON.parse(self.class.get("#{country_string}&units=metric&appid=660fc4ff59cdcee84eb0321163d68677").body)
    end

    def co_ord
      weather_result["coord"]
    end

    def weather
      weather_result["weather"]
    end

    def base
      weather_result["base"]
    end

    def main
      weather_result["main"]
    end

    def visibility
      weather_result["visibility"]
    end

    def wind
      weather_result["wind"]
    end

    def clouds
      weather_result["clouds"]
    end

    def dt
      weather_result["dt"]
    end

    def sys
      weather_result["sys"]
    end

    def id
      weather_result["id"]
    end

    def name
      weather_result["name"]
    end

    def cod
      weather_result["cod"]
    end

end
