const OPEN_WEATHER_BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
const OPEN_WEATHER_4DAY_URL = 'https://api.openweathermap.org/data/2.5/forecast';
const OPEN_WEATHER_API_KEY = '911ffaf80a9fa826a472acd5ceddbadc';


String prepareWeatherUrl(String long, String lat) {
  var url = '$OPEN_WEATHER_BASE_URL?lat=$lat&lon=$long&units=metric&appid=$OPEN_WEATHER_API_KEY';
  return url;
}


String prepareHourlyWeather(String long, String lat) {
  var url = '$OPEN_WEATHER_4DAY_URL?lat=$lat&lon=$long&units=metric&appid=$OPEN_WEATHER_API_KEY';
  return url;
}


// var url = '
// https://api.openweathermap.org/data/2.5/weather?lat=41.73&lon=19.64&appid=911ffaf80a9fa826a472acd5ceddbadc';
// https://api.openweathermap.org/data/3.0/onecall?lat=41.73&lon=19.64&exclude=hourly&appid=911ffaf80a9fa826a472acd5ceddbadc';