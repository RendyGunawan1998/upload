class UserLocation {
  double latitude; // Latitude, in degrees
  double longitude; // Longitude, in degrees
  double
  accuracy; // Estimated horizontal accuracy of this location, radial, in meters
  double altitude; // In meters above the WGS 84 reference ellipsoid
  double speed; // In meters/second
  double speedAccuracy; // In meters/second, always 0 on iOS
  double
  heading; //Heading is the horizontal direction of travel of this device, in degrees
  double time;

  UserLocation({
    this.latitude,
    this.longitude,
    this.accuracy,
    this.altitude,
    this.speed,
    this.speedAccuracy,
    this.heading,
    this.time,
  });

  UserLocation.fromJson(Map<String, dynamic> jsonMap)
      : latitude = jsonMap["lat"] ?? 0.0,
        longitude = jsonMap["lng"] ?? 0.0,
        accuracy = jsonMap["accuracy"] ?? 0.0,
        altitude = jsonMap["altitude"] ?? 0.0,
        speed = jsonMap["speed"] ?? 0.0,
        speedAccuracy = jsonMap["speedAccuracy"] ?? 0.0,
        heading = jsonMap["heading"] ?? 0.0,
        time = jsonMap["time"] ?? 0.0;

  Map<dynamic, dynamic> toJson() => {"lat": latitude, "lng": longitude};
}
