import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';

import '../models/trip.dart';

class ApiService extends ChangeNotifier{
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  static const String baseUrl = 'https://bibiptrip.com/api/avibus';

  Future<List<Trip>> searchTrips(String departureCity, String destinationCity, String date) async {
    try {
      final url = Uri.parse('$baseUrl/search_trips_cities/?departure_city=$departureCity&destination_city=$destinationCity&date=$date');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> tripsJson = jsonData['trips'];
        final List<Trip> trips = tripsJson.map((json) => Trip.fromJson(json)).toList();
        return trips;
      } else {
        throw Exception('Failed to load trips');
      }
    } catch(e) {
      logger.e(e.toString());
      throw Exception('Failed to load trips');
    }
  }

}
