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
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

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
    print("Hello I am");
    _searchSubject.add(value);
  }

  @override
  void initState() {
    super.initState();
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
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
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
