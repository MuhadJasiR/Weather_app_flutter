class Weather {
  Weather({
    this.cloud,
    this.feel,
    this.high,
    this.low,
    this.name,
  });
  final String? name;
  final double? feel;
  final double? low;
  final double? high;
  final String? cloud;

  factory Weather.fromJosn(Map<String, dynamic> json) {
    return Weather(
      name: json['location']['name'],
      feel: json['current']['feelslike_c'],
      high: json['location']['lat'],
      low: json['location']['lon'],
      cloud: json['current']['condition']['text'],
    );
  }
}
