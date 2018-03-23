require "json"
require "httparty"

class MultipleService
  attr_reader :weather_result
  include HTTParty

  base_uri 'http://api.openweathermap.org/data/2.5/group?id='

    def query_ids(country_string)
      @weather_result = JSON.parse(self.class.get("#{country_string}&units=metric&appid=660fc4ff59cdcee84eb0321163d68677").body)
    end

    def results_array
      weather_result["list"]
    end

    def co_ord(i)
      store(i,"coord")
    end

    def weather(i)
      store(i,"weather")
    end

    def base(i)
      store(i,"base")
    end

    def main(i)
      store(i,"main")
    end

    def visibility(i)
      store(i,"visibility")
    end

    def wind(i)
      store(i,"wind")
    end

    def clouds(i)
      store(i,"clouds")
    end

    def dt(i)
      store(i,"dt")
    end

    def sys(i)
      store(i,"sys")
    end

    def id(i)
      store(i,"id")
    end

    def name(i)
      store(i,"name")
    end

    def cod(i)
      store(i,"cod")
    end

    def store(i,key_word)
      arr = []
      results_array.each do |result|
        arr << result["#{key_word}"]
      end
      arr[i]
    end

end
