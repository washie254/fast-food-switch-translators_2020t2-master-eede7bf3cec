import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const API_KEY = "AIzaSyDCeEDyEpJg5XbeOWtOyorY0ft3yFHOJxQ";

class GoogleMapsServices {
  Future<String> getRoute(LatLng from, LatLng to) async {
    String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${from
        .latitude},${from.longitude}&destination=${to.latitude},${to
        .longitude}&key=$API_KEY";
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    return values["routes"][0]["overview_polyline"]["points"]; // mounting  through the body till the polylines to draw it on the map
  }


}