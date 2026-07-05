package com.mockitohandson;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class WeatherServiceTest {

    @Test
    void testFetchWeather() {

        ExternalWeatherAPI api = mock(ExternalWeatherAPI.class);

        when(api.getWeather("Delhi")).thenReturn("Sunny");

        WeatherService service = new WeatherService(api);

        String result = service.fetchWeather("Delhi");

        assertEquals("Sunny", result);

        verify(api).getWeather("Delhi");
    }
}