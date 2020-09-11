//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../services/googleMapsServices.dart';

class MapScreen extends StatefulWidget {
  static const String id = 'map_screen';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController
      mapController; // to get further info about the implemented map
  TextEditingController userLocationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  static LatLng _initialPos;
  LatLng currLocation;
  LatLng _lastPos = _initialPos;
  final Set<Marker> _markers = {}; // to save markers of the map
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentLocation();
  }

  @override
  Widget build(BuildContext context) {
    // return _initialPos ==  null? Container(child: CircularProgressIndicator(),): // to make sure that we get the location async
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(-37.898051, 145.123384), zoom: 17.5),
            onMapCreated: onCreateMap,
            // update the state once the map is created
            myLocationEnabled: true,
            mapType: MapType.normal,
            compassEnabled: true,
            // directions
            markers: _markers,
            onCameraMove: _onCameraMove,
            polylines: _polylines,
          ),
//
          Positioned(
            top: 50.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 55.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 5.0),
                      blurRadius: 10,
                      spreadRadius: 3)
                ],
              ),
              child: TextField(
                cursorColor: Colors.black,
                controller: userLocationController,
                decoration: InputDecoration(
                  icon: Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    width: 20,
                    height: 10,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "here",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                ),
              ),
            ),
          ),

          Positioned(
            top: 110.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 55.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 5.0),
                      blurRadius: 10,
                      spreadRadius: 3)
                ],
              ),
              child: TextField(
                cursorColor: Colors.black,
                controller: destinationController,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) {
                  routeRequest(value);
                },
                decoration: InputDecoration(
                  icon: Container(
                    margin: EdgeInsets.only(left: 20, top: 5),
                    width: 10,
                    height: 10,
                    child: Icon(
                      Icons.fastfood,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "destination?",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onCreateMap(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _addMarker(LatLng to, String addr) {
    // this function the destination of the user and the address to have it as a pin in the map
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(
            _lastPos.toString(),
          ),
          position: to,
          infoWindow: InfoWindow(
            title: addr,
            snippet: "You are at ${addr}",
          ),
          icon: BitmapDescriptor.defaultMarker));
    });
  }

  void drawRoute(
    String encodedPolyline,
  ) {
    setState(() {
      _polylines.add(Polyline(
        polylineId: PolylineId(_lastPos.toString()),
        points: convertToLatLng(_decodePoly(encodedPolyline)),
        width: 10,
        color: Colors.redAccent,
      ));
    });
  }

  void _currentLocation() async {
    print("here");
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
//    print("Here is the position ${placemark[0]}");

    setState(() {
      _initialPos = LatLng(position.latitude, position.longitude);
      userLocationController.text =
          placemark[0].name; // to convert the location into address form
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastPos = position.target;
  }

  // this functoin to convert the list comming from the google polyline func
  List<LatLng> convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 == 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
      return result;
    }
  }

  // This function us provided by googlemaops to decode polyline
  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
// repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negetive then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

/*adding to previous value as done in encoding */

    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];
    print(lList.toString());
    return lList;
  }

  void routeRequest(String destination) async {
    List<Placemark> placemark = await Geolocator()
        .placemarkFromAddress(destination); // convert string into coordonates
    double lat = placemark[0].position.latitude;
    double lng = placemark[0].position.longitude;
    LatLng _theDestenation =
        LatLng(lat, lng); // the user's destination in latlng format.
    String route =
        await _googleMapsServices.getRoute(_initialPos, _theDestenation);
    _addMarker(_theDestenation, destination);
    drawRoute(route);
  }
}
