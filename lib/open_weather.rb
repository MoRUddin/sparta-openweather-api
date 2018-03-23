require_relative "./services/single_service"
require_relative "./services/multiple_service"

class OpenWeather
    def single
      SingleService.new
    end

    def multiple
      MultipleService.new
    end
end
