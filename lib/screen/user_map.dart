// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, unused_field, avoid_print, unused_local_variable, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_bekery/login/login.dart';
import 'package:project_bekery/mysql/service.dart';

class user_MapsPage extends StatefulWidget {
  const user_MapsPage({Key? key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<user_MapsPage> {
  late Position userLocation;
  late GoogleMapController mapController;
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final auth = FirebaseAuth.instance;
  Set<Marker> _markers = Set<Marker>();
  late BitmapDescriptor destinationIcon;
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  String googleAPiKey = 'AIzaSyC_P2HO1gBwXbfe1XXlKDlC-3RomyMnORA';
  double _destLatitude = 13.687151;
  double _destLongitude = 100.622185;

  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection("users");

  Future<Position> _getLocation() async {
    try {
      userLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      // ignore: empty_catches
    } catch (e) {}
    return userLocation;
  }

  void initState() {
    super.initState();

    polylinePoints = PolylinePoints();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setPolylines();
  }

  @override
  Widget build(BuildContext context) {
    polylinePoints = PolylinePoints();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('ออกจากระบบ'),
                      content: const Text('ต้องการที่จะออกจากระบบไหม?'),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("ไม่"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              CupertinoPageRoute(
                                  builder: (context) => LoginPage()),
                              (_) => false,
                            );
                          },
                          child: const Text("ใช่"),
                        ),
                      ],
                    );
                  });
            },
          ),
          backgroundColor: Colors.white.withOpacity(0.1),
          elevation: 0,
          title: Center(
              child: const Text(
            'ยืนยันแผนที่',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          )),
        ),
        body: FutureBuilder(
          future: _getLocation(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GoogleMap(
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                    target:
                        LatLng(userLocation.latitude, userLocation.longitude),
                    zoom: 15),
                markers: _markers,
                polylines: _polylines,
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FloatingActionButton.extended(
                backgroundColor: Color.fromARGB(255, 248, 146, 13),
                onPressed: () {
                  setPolylines();
                  mapController.animateCamera(CameraUpdate.newLatLngZoom(
                      LatLng(userLocation.latitude, userLocation.longitude),
                      18));
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                            'Your location has been send !\nlat: ${userLocation.latitude} long: ${userLocation.longitude} '),
                      );
                    },
                  );
                },
                label: Text("ยืนยันพิกัดที่อยู่"),
                icon: Icon(Icons.near_me),
              ),
            ],
          ),
        ));
  }

  void setPolylines() async {
    print('------WORKING-------');
    String user_email = await SessionManager().get("email");
    print(userLocation.latitude.toString());
    print(userLocation.longitude.toString());
    print(user_email.toString());
    Services()
        .update_map_user(userLocation.latitude.toString(),
            userLocation.longitude.toString(), user_email.toString())
        .then((value) => {
              Fluttertoast.showToast(
                  msg: "แก้ไขข้อมูลเรียบร้อย",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color.fromARGB(255, 9, 255, 0),
                  textColor: Colors.white,
                  fontSize: 16.0),
            });
  }
}
