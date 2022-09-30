

//
//   final List<String> list = [
//     icon: '01d', image: Image.asset('/images/01d@2x.png'),
//     icon: '01n', image: Image.asset('/images/01n@2x.png'),
//     icon: '02d', image: Image.asset('/images/02d@2x.png'),
//     icon: '02n', image: Image.asset('/images/02n@2x.png'),
//     icon: '03d', image: Image.asset('/images/03d@2x.png'),
//     icon: '03n', image: Image.asset('/images/03n@2x.png'),
//     icon: '04d', image: Image.asset('/images/04d@2x.png'),
//     icon: '04n', image: Image.asset('/images/04n@2x.png'),
//     icon: '09d', image: Image.asset('/images/09d@2x.png'),
//     icon: '09n', image: Image.asset('/images/09n@2x.png'),
//     icon: '10d', image: Image.asset('/images/10d@2x.png'),
//     icon: '10n', image: Image.asset('/images/10n@2x.png'),
//     icon: '11d', image: Image.asset('/images/11d@2x.png'),
//     icon: '11n', image: Image.asset('/images/11n@2x.png'),
//     icon: '13d', image: Image.asset('/images/13d@2x.png'),
//     icon: '13n', image: Image.asset('/images/13n@2x.png'),
//     icon: '50d', image: Image.asset('/images/50d@2x.png'),
//     icon: '50n', image: Image.asset('/images/50n@2x.png'),
// ];

  String getWeatherIcon(String icon) {
    if (icon == '01d') {
      return 'images/01d.png';
    } else if (icon == '01n') {
      return 'images/01n.png';
    } else if (icon == '02d') {
      return 'images/02d.png';
    } else if (icon == '02n') {
      return 'images/02n.png';
    } else if (icon == '03d') {
      return 'images/04d.png';
    } else if (icon == '03n') {
      return 'images/03n.png';
    } else if (icon == '04d') {
      return 'images/04d.png';
    } else if (icon == '04n') {
      return 'images/04n.png';
    } else if (icon == '09d') {
      return 'images/09d.png';
    } else if (icon == '09n') {
      return 'images/09n.png';
    } else if (icon == '10d') {
      return 'images/10d.png';
    } else if (icon == '10n') {
      return 'images/10n.png';
    } else if (icon == '11d') {
      return 'images/11d.png';
    } else if (icon == '11n') {
      return 'images/11n.png';
    } else if (icon == '13d') {
      return 'images/13d.png';
    } else if (icon == '13n') {
      return 'images/13n.png';
    } else if (icon == '50d') {
      return 'images/50d.png';
    } else if (icon == '50n') {
      return 'images/50n.png';
    } else{
      return 'images/50px.png';
    }
  }

