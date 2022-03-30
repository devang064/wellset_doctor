import 'package:doctor_1/view%20all/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
late GoogleMapController mapController;

final LatLng _center = const LatLng(45.521563, -122.677433);

void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}
class lablocation extends StatefulWidget {
  const lablocation({Key? key}) : super(key: key);

  @override
  _lablocationState createState() => _lablocationState();

}

class _lablocationState extends State<lablocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text('Search Your Location',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
    //     floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    //     floatingActionButton: FloatingActionButton(
    //     // isExtended: true,
    //     child: Icon(Icons.gps_fixed,color: Color(0xFF2492EC),),
    // backgroundColor: Colors.white,
    // onPressed: () {
    //
    // }),
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
          child: FlatButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>lablocationexe()));},
            child: Text('Next',
                style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
            color: Color(0xff2492EC),height: 40,shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),),
          ),
        ),),


        body: Column(
          children:<Widget> [
      const Padding(
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
            Expanded(child: Container(
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                      tiltGesturesEnabled: true,
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: false,
                     compassEnabled: true,
                      myLocationButtonEnabled: false,
                      buildingsEnabled: true,
                      myLocationEnabled :true,


                    initialCameraPosition: CameraPosition(
                      target: LatLng(6.8814635,79.8876697),
                      zoom: 15.0,),
                    ),
                  Center(
                    child: Icon(Icons.location_on,color: Colors.red,),
                  )
                ],
              ),



            )),
  ]),

    );
  }
}
