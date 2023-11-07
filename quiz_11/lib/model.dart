

class Info {
  final String city;
  final String temperature;
  final String condition;
  final String humidity;
  final String windSpeed;
  Info({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  Info copyWith({
    String? city,
    String? temperature,
    String? condition,
    String? humidity,
    String? windSpeed,
  }) {
    return Info(
      city: city ?? this.city,
      temperature: temperature ?? this.temperature,
      condition: condition ?? this.condition,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'temperature': temperature,
      'condition': condition,
      'humidity': humidity,
      'windSpeed': windSpeed,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      city: map['city'] as String,
      temperature: map['temperature'] as String,
      condition: map['condition'] as String,
      humidity: map['humidity'] as String,
      windSpeed: map['windSpeed'] as String,
    );
  }

  @override
  String toString() {
    return 'Info(city: $city, temperature: $temperature, condition: $condition, humidity: $humidity, windSpeed: $windSpeed)';
  }

  @override
  bool operator ==(covariant Info other) {
    if (identical(this, other)) return true;

    return other.city == city &&
        other.temperature == temperature &&
        other.condition == condition &&
        other.humidity == humidity &&
        other.windSpeed == windSpeed;
  }

  @override
  int get hashCode {
    return city.hashCode ^
        temperature.hashCode ^
        condition.hashCode ^
        humidity.hashCode ^
        windSpeed.hashCode;
  }
}
