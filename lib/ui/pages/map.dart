import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:space_x/model/landpad.dart';
import 'package:space_x/model/launchpad.dart';
import 'package:space_x/view_models/map_view_model.dart';
import 'package:uuid/uuid.dart';

class MapScreen extends StatelessWidget {

  static const route = "/map";

  late GoogleMapController _googleMapController;
  final Set<Marker> markers = new Set();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapViewModel(),
      child: Consumer<MapViewModel>(builder: (context, MapViewModel model, child) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: const Text('Google Maps'),
            ),
            body: Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: (controller) => _googleMapController = controller,
                  markers: getMarkers(model.landpads!, model.launchpads!),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.black,
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(_initialCameraPosition),
              ),
              child: const Icon(Icons.center_focus_strong),
            ),
          );
      }));
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(36.966428, -95.0),
    zoom: 3,
  );


  Set<Marker> getMarkers(List<Landpad> landpads, List<Launchpad> launchpads){
    for (Landpad landpad in landpads){
      addMarker(landpad, null);
    }
    for (Launchpad launchpad in launchpads){
      addMarker(null, launchpad);
    }
    return markers;
  }

  void addMarker(Landpad? ldp, Launchpad? lhp) {
    if(ldp == null){
      markers.add(Marker(
        markerId: MarkerId(lhp!.id),
        infoWindow: InfoWindow(title: lhp.name),
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(lhp.latitude, lhp.longitude),
      ));
    } else {
      markers.add(Marker(
        markerId: MarkerId(ldp.id),
        infoWindow: InfoWindow(title: ldp.name),
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: LatLng(ldp.latitude, ldp.longitude),
      ));
    }


  }

}