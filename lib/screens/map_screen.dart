import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final scan = ModalRoute.of(context)?.settings.arguments as ScanModel;
    final CameraPosition _initialCameraPosition =
        CameraPosition(target: scan.getLatLng(), zoom: 17, tilt: 50);

    // Markers
    Set<Marker> markers = <Marker>{};
    markers.add(
      Marker(
        markerId: const MarkerId('geo-location'),
        position: scan.getLatLng(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_searching_outlined),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(target: scan.getLatLng(), zoom: 17, tilt: 50),
                ),
              );
            },
          )
        ],
      ),
      body: GoogleMap(
        compassEnabled: true,
        markers: markers,
        mapType: mapType,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            (mapType == MapType.normal)
                ? mapType = MapType.hybrid
                : mapType = MapType.normal;
          });
        },
        child: const Icon(Icons.layers_rounded),
      ),
    );
  }
}
