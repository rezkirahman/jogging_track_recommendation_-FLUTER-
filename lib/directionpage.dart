import 'package:demodemo/constants.dart';
import 'package:demodemo/dataj.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class DirectionPage extends StatelessWidget {
  final Dataj data;

  const DirectionPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "img/LOGO.png",
            width: 80,
          ),
          backgroundColor: kBackgroundColor,
        ),
        body: Direction(dataTrack: data));
  }
}

class Direction extends StatefulWidget {
  final Dataj dataTrack;
  const Direction({Key key, this.dataTrack}) : super(key: key);
  @override
  _DirectionState createState() => _DirectionState();
}

class _DirectionState extends State<Direction> {
  final Set<Marker> _markers = {};
  final Geolocator _geolocator = Geolocator();
  // ignore: non_constant_identifier_names
  var _CurrentPosition;
  PolylinePoints polylinePoints;
  List<LatLng> polylinecoordinates = [];
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _markers.add(
      Marker(
          markerId: MarkerId("marker"),
          position:
              LatLng(widget.dataTrack.latitude, widget.dataTrack.longitude),
          icon: BitmapDescriptor.defaultMarker,
          draggable: false),
    );
  }

  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _CurrentPosition = position;
        print('CURRENT POST: $_CurrentPosition');
      });
    }).catchError((e) {
      print(e);
    });
  }

  _createPolylines(double startlat, double startlng, double destinationlat,
      double destinationlng) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyCsRHVqIc9WDn1wXwNlnr--xWdPyQ3KRC4",
        PointLatLng(startlat, startlng),
        PointLatLng(destinationlat, destinationlng),
        travelMode: TravelMode.transit);

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylinecoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylinecoordinates,
      width: 3,
    );
    polylines[id] = polyline;
    print(result.points);
  }

  @override
  Widget build(BuildContext context) {
    getPosition();
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
      trafficEnabled: true,
      buildingsEnabled: true,
      compassEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.dataTrack.latitude, widget.dataTrack.longitude),
        zoom: 14,
      ),
      markers: Set.from(_markers),
      //polylines:
    );
  }
}
