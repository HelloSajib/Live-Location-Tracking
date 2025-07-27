import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:live_location_tracking/place_details_model.dart';
import 'package:live_location_tracking/places_model.dart';

class ApiServices {
  final String apiKey = "";

  /// Get place autocomplete suggestions using Places API (New)
  Future<PlacesModel?> getPlaces(String input) async {
    final url = Uri.parse('https://places.googleapis.com/v1/places:autocomplete');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': apiKey,
        // Only request the fields you need to reduce costs
        'X-Goog-FieldMask': 'predictions.placeId,predictions.text',
      },
      body: jsonEncode({
        "input": input,
      }),
    );

    if (response.statusCode == 200) {
      print("Autocomplete Response: ${response.body}");
      return PlacesModel.fromJson(jsonDecode(response.body));
    } else {
      print("Autocomplete Error: ${response.body}");
      return null;
    }
  }

  /// Get place details using Places API (New)
  Future<PlaceDetailsModel?> getPlaceDetails(String placeId) async {
    final url = Uri.parse('https://places.googleapis.com/v1/places/$placeId');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': apiKey,
        // Select only the fields you actually need
        'X-Goog-FieldMask':
        'id,displayName,formattedAddress,location,rating,userRatingCount,websiteUri',
      },
    );

    if (response.statusCode == 200) {
      print("Place Details Response: ${response.body}");
      return PlaceDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      print("Place Details Error: ${response.body}");
      return null;
    }
  }
}
