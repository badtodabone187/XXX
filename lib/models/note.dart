class NodifyNote {
  final String title;
  final String text;
  final DateTime createdAt;

  final double? latitude;
  final double? longitude;
  final double? altitude;

  NodifyNote({
    required this.title,
    required this.text,
    required this.createdAt,
    this.latitude,
    this.longitude,
    this.altitude,
  });
}