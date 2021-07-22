
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projectname33/page/helper/constants.dart';
import 'package:projectname33/page/network/response/HomeScreenResponse.dart';
import 'package:url_launcher/url_launcher.dart';
import 'balance_screen_new.dart';
class DirectionNew extends StatefulWidget {
  List<Acceptedorders> acceptedorders;
  String address;
  String longitude;
  String latitude;
  String shopname;
  @override
  _DirectionNewState createState() => new _DirectionNewState(latitude:this.latitude,longitude:this.longitude,shopname:this.shopname,address:this.address);
  DirectionNew( {this.address, this.shopname, this.longitude, this.latitude});
}

Map<MarkerId, Marker> markers = {};

PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};

class _DirectionNewState extends State<DirectionNew> {
  List<Acceptedorders> itemordersNew;
   String _value = "";
  String address;
  String longitude;
  String latitude;
  String shopname;

  Completer<GoogleMapController> _controller = Completer();
  // Configure map position and zoom
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.0419, 75.3679),
    zoom: 9.4746,
  );


  _DirectionNewState({this.latitude,this.longitude,this.shopname,this.address});

  @override
  void initState() {

    /// add origin marker origin marker
    _addMarker(
      LatLng(12.0419, 75.3679),
      "origin",
      BitmapDescriptor.defaultMarker,
    );

    // Add destination marker
    //  _destLatitude = latitude;
    // double _destLongitude = longitude;
    _addMarker(
      LatLng(double.parse(latitude), double.parse(longitude)),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
    );

    _getPolyline();


    super.initState();
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  Widget appBar(BuildContext context) {

    return AppBar(
      flexibleSpace: Container(
  color: colorPrimary,),
      centerTitle: true,
        actions: [
          PopupMenuButton(
              color: Colors.white,
              elevation: 20,
              enabled: true,
              onSelected: (value) {
                setState(() {
                  _value = value;
                });
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      BalanceScreenNew()));
                        },
                        child: TextField(
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "COD balance",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 12),
                            prefixIcon: Icon(
                              Icons.monetization_on,
                              size: 18,
                            ),
                            border: InputBorder.none,

                            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          logout(context);
                        },
                        child: TextField(
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Logout",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 12),
                            prefixIcon: Icon(
                              Icons.logout,
                              size: 18,
                            ),
                            border: InputBorder.none,
                            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                          ),
                        ),
                      ),
                    ),
                  ])
        ],
      title: Container(
        child: Text(
          '2c Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    debugPrint('$APP_TAG ReturnToStoreScreen build()');
    return Scaffold(
      // use Scaffold also in order to provide material app widgets
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: getContent(),

    );
  }
Widget getContent(){
    return Container(
      color:Colors.white,
      child:Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child:
            Column(
              children: [
               Container(
                 height: MediaQuery.of(context).size.height/2.5,
                 width: double.infinity,
                 // color: Colors.red,
                 child:
                 GoogleMap(
                   mapType: MapType.normal,
                   initialCameraPosition: _kGooglePlex,
                   myLocationEnabled: true,
                   tiltGesturesEnabled: true,
                   compassEnabled: true,
                   scrollGesturesEnabled: true,
                   zoomGesturesEnabled: true,
                   polylines: Set<Polyline>.of(polylines.values),
                   markers: Set<Marker>.of(markers.values),
                   onMapCreated: (GoogleMapController controller) {
                     _controller.complete(controller);
                   },
                 ),


                 // FadeInImage.assetNetwork(
                 //   fit: BoxFit.cover,
                 //   placeholder: 'assets/images/direction.png',
                 //   image: 'assets/images/direction.png',
                 //   // image: orders.image,
                 //   // image: order?.packageInfo?.origination?.logo ?? '',
                 // ),
                 // Image.asset('assets/images/direction.png',fit: BoxFit.cover,),
                 // child:
               ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(shopname,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),)),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(address,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 15),)),
                    ],
                  ),
                )

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
                _launchUrl(
                  // 'http://maps.google.com/?saddr=My+Location&daddr=${task.order.first?.packageInfo?.origination?.address}');
                    'http://maps.google.com/?saddr=My+Location&daddr=${latitude}${','}${longitude}');
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 35,left: 15,right: 15),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.black
                ),
                child: Center(child: Text('PROCEED',style: TextStyle(color: Colors.white,fontSize: 15),)),
              ),
            ),
          )
        ],
      )

    );
}

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // This method will add markers to the map based on the LatLng position
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }
  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAIjaTpHNWTYXsHI-aW1kNxGQVXc3_epGA",
      PointLatLng(12.0419, 75.3679),
      PointLatLng(double.parse(latitude), double.parse(longitude)),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }


}
