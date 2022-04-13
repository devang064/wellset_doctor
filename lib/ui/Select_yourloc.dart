import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Sel_yourloc extends StatefulWidget {
  const Sel_yourloc({Key? key}) : super(key: key);

  @override
  State<Sel_yourloc> createState() => _Sel_yourlocState();
}

class _Sel_yourlocState extends State<Sel_yourloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text('Select Your Location',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),)),
      body: SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0,left: 8),
                    child: Image.asset('assets/Image/icons/location.png',height: 16.h,width: 16.w,),
                  ),
          Text("Select Location Via Map",style: TextStyle(fontFamily: "Montserrat Medium",fontSize: 16.sp, decoration: TextDecoration.underline),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(height: 1.h,color: Colors.black26),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 8,top: 8),
                child: Text("Saved Addresses",style: TextStyle(fontFamily: "Montserrat Bold",fontSize: 16.sp,),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on,color: Colors.black26,size: 16,),
                    Text('office',
                      style: TextStyle(color: Colors.black26,fontFamily: "Montserrat Medium",fontSize: 16.sp),),
                  ],

                ),
              ),

            ],
          ),
        ),
      ),);
  }
}
