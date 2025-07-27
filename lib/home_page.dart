import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_location_tracking/api_services.dart';
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SearchController searchController = SearchController();
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  BitmapDescriptor? destinationPointMarker;
  BitmapDescriptor? startingPointMarker;

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(23.874605005690704, 90.39072062173672),
    zoom: 16,
  );

  final BehaviorSubject<String> _searchSubject = BehaviorSubject<String>();

  Future<void> searchLocation() async {
    _searchSubject.debounceTime(Duration(seconds: 2)).listen((query)async{
      await ApiServices().getPlaces(query);
    });
  }

  void onChangedSearch(String value){
    _searchSubject.add(value);
  }


  Future<void> markerIcon() async {
    startingPointMarker = await BitmapDescriptor.asset(
        ImageConfiguration(size: Size(48, 48)),
        "assets/images/pin_point.png"
    );
    destinationPointMarker = await BitmapDescriptor.asset(
        ImageConfiguration(size: Size(48, 48)),
        "assets/images/destinations.png"
    );
    assert(startingPointMarker != null, "Start point marker Null");
    assert(destinationPointMarker != null, "Destination point marker Null");
    setState(() {});
  }



  @override
  void initState() {
    super.initState();
    markerIcon();
    searchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [

                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _initialCameraPosition,
                  compassEnabled: true,
                  indoorViewEnabled: true,
                  trafficEnabled: false,
                  zoomControlsEnabled: false,
                  markers: {

                    Marker(
                        markerId: MarkerId("start 1"),
                        position: LatLng(23.874369603652664, 90.39083844449992),
                        icon: startingPointMarker ??
                            BitmapDescriptor.defaultMarker
                    ),


                    Marker(
                        markerId: MarkerId("end 1"),
                        position: LatLng(23.879010040329618, 90.39063459659631),
                        icon: destinationPointMarker ??
                            BitmapDescriptor.defaultMarker
                    ),

                  },
                  fortyFiveDegreeImageryEnabled: false,
                  polylines: {

                    Polyline(
                      visible: true,
                      polylineId: PolylineId('polyline1'),
                      color: Colors.red,
                      width: 8,
                      points: [
                        LatLng(23.874369603652664, 90.39083844449992), // Starting point
                        LatLng(23.879010040329618, 90.39063459659631),
                      ],
                      patterns: [
                        PatternItem.dot,
                        PatternItem.gap(5),
                      ]
                    ),

                  },
                  // onMapCreated: (GoogleMapController controller) {
                  //   _controller.complete(controller);
                  // },
                ),


                // Positioned(
                //   top: 20,
                //   child: SizedBox(
                //     width: 350,
                //     child: SearchAnchor.bar(
                //         searchController: searchController,
                //         barHintText: "Search Google Maps",
                //         suggestionsBuilder: (context, controller) {
                //           return [
                //             Text("Hello")
                //           ];
                //         },
                //         onChanged: onChangedSearch,
                //     ),
                //   ),
                // ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
