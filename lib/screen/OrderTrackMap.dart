import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pets_project/constants/ConstantColors.dart';
import 'package:flutter_pets_project/constants/ConstantWidgets.dart';
import 'package:flutter_pets_project/constants/Constants.dart';
import 'package:flutter_pets_project/constants/SizeConfig.dart';
import 'package:flutter_pets_project/model/Message.dart';
import 'package:flutter_pets_project/screen/ChatScreen.dart';
import 'package:flutter_pets_project/screen/OrderTrackingPage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/l10n.dart';


class OrderTrackMap extends StatefulWidget {
  @override
  _OrderTrackMap createState() => _OrderTrackMap();
}

class _OrderTrackMap extends State<OrderTrackMap> {
  GoogleMapController controller;
  static LatLng _initialPosition;

  void _getUserLocation() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    print("getlatlong11==${geolocator.forceAndroidLocationManager}");

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((position) {
      setState(() {
        _initialPosition = LatLng(40.91163687464769+30, -74.52864461445306+30);
        controller.showMarkerInfoWindow(MarkerId("Ey"));

        print("getlatlong==${position.latitude}--${position.longitude}");
      });
    });
  }

  @override
  void initState() {
    // _add();
    _getUserLocation();
    super.initState();
  }

  void _onMapCreated(GoogleMapController controllers) {
    controller = controllers;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    PolylineId polylineId = PolylineId("area");
    PolylineId polylineId2 = PolylineId("area2");
    double bottomHeight = SizeConfig.safeBlockVertical * 20;
    double bottomImageHeight = Constants.getPercentSize(bottomHeight, 50);
    return WillPopScope(
        child: Scaffold(
          backgroundColor: "#ECE9E1".toColor(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                finish();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: textColor,
              ),
            ),
            backgroundColor: ConstantColors.bgColor,
            title: getCustomText(S
                .of(context)
                .trackOrder, textColor, 1,
                TextAlign.center, FontWeight.bold, 17),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: ConstantColors.bgColor,
                    margin: EdgeInsets.only(
                      bottom:SizeConfig.safeBlockVertical * 15,
                    ),
                    child: GoogleMap(
                              onMapCreated: _onMapCreated,
                              myLocationEnabled: true,
                              // consumeTapEvents: true,
                              myLocationButtonEnabled: false,
                              zoomControlsEnabled: true,
                              zoomGesturesEnabled: true,
                              // mapType: MapType.none,
                              rotateGesturesEnabled: false,
                              scrollGesturesEnabled: true,
                              tiltGesturesEnabled: false,
                              // myLocationEnabled: true,
                              initialCameraPosition: CameraPosition(
                                // target: LatLng(21.2089, 72.8907),
                                target:       LatLng(40.91163687464769+30, -74.52864461445306+30),

                                // target: LatLng(21.2117, 72.8858),

                                zoom: 7,
                              ),

                              markers: Set<Marker>.of(<Marker>[
                                Marker(
                                    markerId: MarkerId("Ey"),
                                    position: (_initialPosition != null)
                                        ? _initialPosition
                                        : LatLng(0, 0),
                                    visible: true,
                                    flat: false,
                                    infoWindow: InfoWindow(
                                      title: "Estimated Time",
                                      snippet: "5-10 min",
                                    )),
                              ]),
                              polylines: Set<Polyline>.of(<Polyline>[
                                Polyline(
                                    polylineId: polylineId,
                                    points: getPoints(),
                                    width: 5,
                                    color: Colors.green,

                                    visible: true),
                                Polyline(
                                    polylineId: polylineId2,
                                    points: getPoint2(),
                                    width: 5,
                                    color: Colors.grey,

                                    visible: true)
                              ]),
                              polygons: Set<Polygon>.of(<Polygon>[
                                Polygon(
                                    polygonId: PolygonId('area'),
                                    points: getPoints(),
                                    strokeColor: Colors.pink,
                                    strokeWidth: 5,
                                    fillColor: Colors.transparent,

                                    visible: true),
                              ]),
                            ),
                          ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: SizeConfig.safeBlockVertical * 20,
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getHorizonSpace(SizeConfig.safeBlockHorizontal * 4),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(
                                Constants.getPercentSize(bottomImageHeight, 12))),
                            child: Image.asset(
                              Constants.assetsImagePath + "hugh.png",
                              fit: BoxFit.cover,
                              width: bottomImageHeight,
                              height: bottomImageHeight,
                            ),
                          ),
                          getHorizonSpace(SizeConfig.safeBlockHorizontal * 1.5),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => OrderTrackingPage(),
                                  ));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getCustomText(
                                        "James King",
                                        textColor,
                                        1,
                                        TextAlign.start,
                                        FontWeight.w500,
                                        Constants.getPercentSize(
                                            bottomHeight, 15)),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: accentColors,
                                          size: Constants.getPercentSize(
                                              bottomHeight, 15),
                                        ),
                                        getHorizonSpace(
                                            SizeConfig.safeBlockHorizontal * 1.2),
                                        getCustomText(
                                            "ID 2445556",
                                            primaryTextColor,
                                            1,
                                            TextAlign.start,
                                            FontWeight.normal,
                                            Constants.getPercentSize(
                                                bottomHeight, 12))
                                      ],
                                    )
                                  ],
                                ),
                              )),
                          IconButton(
                              icon: Icon(
                                Icons.call,
                                color: accentColors,
                                size: Constants.getPercentSize(bottomHeight, 20),
                              ),
                              onPressed: () {
                                _callNumber();
                              }),
                          IconButton(
                              icon: Icon(
                                CupertinoIcons.chat_bubble_text_fill,
                                color: accentColors,
                                size: Constants.getPercentSize(bottomHeight, 20),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ChatScreen(user: chats[0].sender),));
                              }),
                          getHorizonSpace(SizeConfig.safeBlockHorizontal * 4),
                        ],
                      ),
                    ),
                  )

                ],
              )
            // child: Column(
            //   children: [
            //     Expanded(
            //       flex: 1,
            //       child: GoogleMap(
            //         onMapCreated: _onMapCreated,
            //         myLocationEnabled: true,
            //         // consumeTapEvents: true,
            //         myLocationButtonEnabled: false,
            //         zoomControlsEnabled: true,
            //         zoomGesturesEnabled: true,
            //         // mapType: MapType.none,
            //         rotateGesturesEnabled: false,
            //         scrollGesturesEnabled: true,
            //         tiltGesturesEnabled: false,
            //         // myLocationEnabled: true,
            //         initialCameraPosition: CameraPosition(
            //           // target: LatLng(21.2089, 72.8907),
            //           target:       LatLng(40.91163687464769+30, -74.52864461445306+30),
            //
            //           // target: LatLng(21.2117, 72.8858),
            //
            //           zoom: 7,
            //         ),
            //
            //         markers: Set<Marker>.of(<Marker>[
            //           Marker(
            //               markerId: MarkerId("Ey"),
            //               position: (_initialPosition != null)
            //                   ? _initialPosition
            //                   : LatLng(0, 0),
            //               visible: true,
            //               flat: false,
            //               infoWindow: InfoWindow(
            //                 title: "Estimated Time",
            //                 snippet: "5-10 min",
            //               )),
            //         ]),
            //         polylines: Set<Polyline>.of(<Polyline>[
            //           Polyline(
            //               polylineId: polylineId,
            //               points: getPoints(),
            //               width: 5,
            //               color: Colors.green,
            //
            //               visible: true),
            //           Polyline(
            //               polylineId: polylineId2,
            //               points: getPoint2(),
            //               width: 5,
            //               color: Colors.grey,
            //
            //               visible: true)
            //         ]),
            //         polygons: Set<Polygon>.of(<Polygon>[
            //           Polygon(
            //               polygonId: PolygonId('area'),
            //               points: getPoints(),
            //               strokeColor: Colors.pink,
            //               strokeWidth: 5,
            //               fillColor: Colors.transparent,
            //
            //               visible: true),
            //         ]),
            //       ),
            //     ),
            //     Container(
            //       width: double.infinity,
            //       height: SizeConfig.safeBlockVertical * 20,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(40),
            //               topRight: Radius.circular(40)),
            //           color: Colors.white),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           getHorizonSpace(SizeConfig.safeBlockHorizontal * 4),
            //           ClipRRect(
            //             borderRadius: BorderRadius.all(Radius.circular(
            //                 Constants.getPercentSize(bottomImageHeight, 12))),
            //             child: Image.asset(
            //               Constants.assetsImagePath + "hugh.png",
            //               fit: BoxFit.cover,
            //               width: bottomImageHeight,
            //               height: bottomImageHeight,
            //             ),
            //           ),
            //           getHorizonSpace(SizeConfig.safeBlockHorizontal * 1.5),
            //           Expanded(
            //               child: InkWell(
            //                 onTap: () {
            //                   Navigator.of(context).push(MaterialPageRoute(
            //                     builder: (context) => OrderTrackingPage(),
            //                   ));
            //                 },
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     getCustomText(
            //                         "James King",
            //                         Colors.black87,
            //                         1,
            //                         TextAlign.start,
            //                         FontWeight.w500,
            //                         Constants.getPercentSize(bottomHeight, 15)),
            //                     Row(
            //                       children: [
            //                         Icon(
            //                           Icons.check_circle,
            //                           color: accentColors,
            //                           size: Constants.getPercentSize(
            //                               bottomHeight, 15),
            //                         ),
            //                         getHorizonSpace(
            //                             SizeConfig.safeBlockHorizontal * 1.2),
            //                         getCustomText(
            //                             "ID 2445556",
            //                             Colors.grey,
            //                             1,
            //                             TextAlign.start,
            //                             FontWeight.normal,
            //                             Constants.getPercentSize(bottomHeight, 12))
            //                       ],
            //                     )
            //                   ],
            //                 ),
            //               )),
            //           IconButton(
            //               icon: Icon(
            //                 Icons.call,
            //                 color: accentColors,
            //                 size: Constants.getPercentSize(bottomHeight, 20),
            //               ),
            //               onPressed: () {
            //                 _callNumber();
            //               }),
            //           IconButton(
            //               icon: Icon(
            //                 CupertinoIcons.chat_bubble_text_fill,
            //                 color: accentColors,
            //                 size: Constants.getPercentSize(bottomHeight, 20),
            //               ),
            //               onPressed: () {
            //                 Navigator.of(context).push(MaterialPageRoute(builder:(context) => ChatScreen(user:chats[0].sender),));
            //
            //               }),
            //           getHorizonSpace(SizeConfig.safeBlockHorizontal * 4),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
          ),
        ),
        onWillPop: () async {
          finish();
          return false;
        });
  }
  void _callNumber() async {
    String s="89898989";
    // launch("tel:"+s);
    // launch("tel://"+s);
    String url = "tel:"+s;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not call $s';
    }
  }

  getPoints() {
    return [
      LatLng(40.91163687464769, -74.52864461445306),
      // LatLng(21.2117 - 15, 72.8858 - 15),
      LatLng(40.91163687464769+30, -74.52864461445306+30),
    ];
  }

  getPoint2() {
    return [
      // LatLng(21.2089, 72.8907),
      // LatLng(21.2089 + 20, 72.8907 + 20),


      LatLng(40.91163687464769+30, -74.52864461445306+30),
      LatLng(40.91163687464769 + 50, -74.52864461445306 + 50),

      // LatLng(21.2084, 72.8990),
    ];
  }

  void finish() {
    Navigator.of(context).pop();
  }
}
