const OPEN_WEATHER_BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
const OPEN_WEATHER_4DAY_URL = 'https://api.openweathermap.org/data/2.5/forecast';
const OPEN_WEATHER_API_KEY = 'api key on openwether';


String prepareWeatherUrl(String long, String lat) {
  var url = '$OPEN_WEATHER_BASE_URL?lat=$lat&lon=$long&units=metric&appid=$OPEN_WEATHER_API_KEY';
  return url;
}


String prepareHourlyWeather(String long, String lat) {
  var url = '$OPEN_WEATHER_4DAY_URL?lat=$lat&lon=$long&units=metric&appid=$OPEN_WEATHER_API_KEY';
  return url;
}

