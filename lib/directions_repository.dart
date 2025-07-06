import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'directions_model.dart';

class DirectionsRepo {
  static const String baseUrl = 'https://maps.googleapis.com/maps/api/directions/json';

  final Dio _dio = Dio();

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      final response = await _dio.get(
        baseUrl,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': 'AIzaSyAAOcn3r6DVavhuoPatQvNGg5kUuV1zAFo',
        },
      );

      if (response.statusCode == 200) {
        return Directions.fromMap(response.data);
      }
    } catch (e) {
      print('Error directions: $e');
    }
    return null;
  }
}
