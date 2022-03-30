// import 'package:flutter/material.dart';
// import 'package:doctor/view%20all/map.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// late GoogleMapController mapController;
//
// final LatLng _center = const LatLng(45.521563, -122.677433);
//
// void _onMapCreated(GoogleMapController controller) {
//   mapController = controller;
// }
// class lablocationexe extends StatefulWidget {
//   const lablocationexe({Key? key}) : super(key: key);
//
//   @override
//   _lablocationState createState() => _lablocationState();
//
// }
//
// class _lablocationState extends State<lablocationexe> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,elevation: 0,
//         centerTitle: true,
//         title: Text('Search Your ',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
//         leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
//       ),
//       //     floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
//       //     floatingActionButton: FloatingActionButton(
//       //     // isExtended: true,
//       //     child: Icon(Icons.gps_fixed,color: Color(0xFF2492EC),),
//       // backgroundColor: Colors.white,
//       // onPressed: () {
//       //
//       // }),
//       bottomNavigationBar:
//       //     BottomAppBar(
//       //         elevation: 0,
//       //         color: Colors.transparent,
//       //         child:Padding(
//       //           padding: const EdgeInsets.all(10),
//       //           child: FlatButton(onPressed: (){},
//       //             child: Text('Next',
//       //                 style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
//       //             color: Color(0xff2492EC),height: 50,shape:RoundedRectangleBorder(
//       //               borderRadius: BorderRadius.circular(15.r),),
//       //           ),
//       //         ) ,
//       //     ),
//       Container(color: Colors.transparent,
//         height: 50,
//         margin: EdgeInsets.all(10),
//         child: Padding(
//           padding: const EdgeInsets.only(right: 8,left: 8),
//           child: FlatButton(onPressed: (){},
//             child: Text('Next',
//                 style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
//             color: Color(0xff2492EC),height: 40,shape:RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.r),),
//           ),
//         ),),
//
//
//       body: Column(
//           children:<Widget> [
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//               child:
//               TextField(cursorHeight: 20,
//                 decoration: InputDecoration(prefixIcon: Icon(Icons.search),isDense: true,                      // Added this
//                     contentPadding: EdgeInsets.only(top:2,bottom: 2),
//                     border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(15)),),
//                     hintText: 'Enter a search term'
//                 ),
//               ),
//             ),
//             Expanded(child: Container(
//               child: GoogleMap(
//                 onMapCreated: _onMapCreated,
//                 tiltGesturesEnabled: true,
//                 zoomGesturesEnabled: true,
//                 zoomControlsEnabled: false,
//
//                 myLocationButtonEnabled: false,
//                 buildingsEnabled: true,
//                 myLocationEnabled :true,
//
//
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(6.8814635,79.8876697),
//                   zoom: 15.0,),
//               ),
//
//
//
//             )),
//           ]),
//
//     );
//   }
// }

import 'package:doctor_1/exp/locexe.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../exp/address.dart';




class lablocationexe extends StatefulWidget {
  @override
  _lablocationexe createState() => _lablocationexe();
}

class _lablocationexe extends State<lablocationexe> {

  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  late GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((dynamic l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 15),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text('Search Your Locat',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
      bottomNavigationBar:
      //     BottomAppBar(
      //         elevation: 0,
      //         color: Colors.transparent,
      //         child:Padding(
      //           padding: const EdgeInsets.all(10),
      //           child: FlatButton(onPressed: (){},
      //             child: Text('Next',
      //                 style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
      //             color: Color(0xff2492EC),height: 50,shape:RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(15.r),),
      //           ),
      //         ) ,
      //     ),
      Container(color: Colors.transparent,
        height: 50,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(right: 8,left: 8),
          child: FlatButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Add_Address()));
              },
            child: Text('Next',
                style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
            color: Color(0xff2492EC),height: 40,shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),),
          ),
        ),),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child:
            TextField(cursorHeight: 20,
              decoration: InputDecoration(prefixIcon: Icon(Icons.search),isDense: true,                      // Added this
                  contentPadding: EdgeInsets.only(top:2,bottom: 2),
                  border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(15)),),
                  hintText: 'Enter a search term'
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [

                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        child:
                        TextField(cursorHeight: 20,
                          decoration: InputDecoration(prefixIcon: Icon(Icons.search),isDense: true,                      // Added this
                              contentPadding: EdgeInsets.only(top:2,bottom: 2),
                              border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(15)),),
                              hintText: 'Enter a search term'
                          ),
                        ),
                      ),
                      GoogleMap(
                        compassEnabled: true,
                       initialCameraPosition: CameraPosition(target: _initialcameraposition),

                        onMapCreated: _onMapCreated,
                      //  myLocationEnabled: true,
                          mapType: MapType.normal,
                        //myLocationButtonEnabled: true,
                        zoomControlsEnabled: false,
                       // mapToolbarEnabled: true,
                        //tiltGesturesEnabled: true,
                       // indoorViewEnabled: false,

                       // rotateGesturesEnabled: true,
//
                      ),
                      Center(
                        child: Image.asset('assets/Image/icons/location.png',height: 30,width: 30,)
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
