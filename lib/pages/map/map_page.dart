import 'dart:async';

import 'package:balinasoft_test_app/pages/map/map_presenter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> implements MapPageContract {
  late final MapPagePresenter presenter;

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(53.900577, 27.559002),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    presenter = MapPagePresenter(this);
    presenter.initMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(presenter.markers),
      ),
    );
  }

  @override
  void stateManager() {
    setState(() {});
  }
}
