import 'dart:convert';

class Trip {
  final String id;
  final String departureCity;
  final String destinationCity;
  final String date;

  Trip({
    required this.id,
    required this.departureCity,
    required this.destinationCity,
    required this.date,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      departureCity: json['departure_city'],
      destinationCity: json['destination_city'],
      date: json['date'],
    );
  }
}
