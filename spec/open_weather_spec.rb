require 'spec_helper'

describe OpenWeather do

  context 'requesting information on a single weather works correctly' do

    before(:all) do
      @open_weather = OpenWeather.new.single
      @response = @open_weather.query_id('2643743') #input a city id
    end

    it "should respond with a coordinates hash" do
      expect(@open_weather.co_ord).to be_a(Hash)
    end

    it "should respond with a lattitude string" do
      expect(@open_weather.co_ord["lat"]).to be_a(Float)
    end

    it "should respond with a longitude string" do
      expect(@open_weather.co_ord["lon"]).to be_a(Float)
    end

    it "should respond with a weather array" do
      expect(@open_weather.weather).to be_an(Array)
    end

    it "should respond with a weather array should contain a hash with 4 elements inside it" do
      expect(@open_weather.weather[0].length).to eq(4)
    end

    it "should respond with the base 'stations'" do
      expect(@open_weather.base).to eq("stations")
    end

    it "should respond with a main hash with 5 elements in it" do
      expect(@open_weather.main.length).to eq(5)
    end

    it "should respond with a visibility integer" do
      expect(@open_weather.visibility).to be_an(Integer)
    end

    it "should respond with a wind hash" do
      expect(@open_weather.wind).to be_a(Hash)
    end

    it "should respond with a wind hash with 2 elements in it" do
      expect(@open_weather.wind.length).to eq(2)
    end

    it "should respond with a clouds hash" do
      expect(@open_weather.clouds).to be_a(Hash)
    end
  end

  context "multiple weather validation" do

    before(:all) do
      @open_weather = OpenWeather.new.multiple
      @response = @open_weather.query_ids("524901,703448,2643743") #input city ids
    end

    it "should respond with a count (number of searched cities)" do
      expect(@open_weather.count).to eq(@open_weather.results_array.length)
    end

    it "should respond with the name 'London'" do
      expect(@open_weather.name(2)).to eq("London")
    end

    it "should respond with the name 'Kiev'" do
      expect(@open_weather.name(1)).to eq("Kiev")
    end

    it "should respond with the name 'Moscow'" do
      expect(@open_weather.name(0)).to eq("Moscow")
    end

    it "should respond with the country 'GB' for London" do
      expect(@open_weather.sys(2)["country"]).to eq("GB")
    end

    it "should respond with the country 'RU' for Moscow" do
      expect(@open_weather.sys(0)["country"]).to eq("RU")
    end
  end

end
