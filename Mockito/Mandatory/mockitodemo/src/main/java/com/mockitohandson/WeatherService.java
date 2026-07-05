package com.mockitohandson;

public class WeatherService {

    private ExternalWeatherAPI externalWeatherAPI;

    public WeatherService(ExternalWeatherAPI externalWeatherAPI) {
        this.externalWeatherAPI = externalWeatherAPI;
    }

    public String fetchWeather(String city) {
        return externalWeatherAPI.getWeather(city);
    }
}
