import 'package:doctor_1/lab.dart';
import 'package:doctor_1/notification.dart';
import 'package:doctor_1/view%20all/Review_and_Ratings.dart';
import 'package:doctor_1/view%20all/Time_Date.dart';
import 'package:doctor_1/view%20all/labtest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Lab_info extends StatefulWidget {
  const Lab_info({Key? key}) : super(key: key);

  @override
  _Lab_DetailsState createState() => _Lab_DetailsState();
}

class list {
  const list({ required this.Day,required this.Time,required this.open});

  final String Day;
  final String Time;
  final String open;
}
const List<list> choices = <list>[
  list(Day: "Sunday", Time: "", open:"Closed"),
  list(Day: "Monday", Time: "10:30AM-7:30 PM", open:"Open"),
  list(Day: "Monday", Time: "10:30AM-7:30 PM", open:"Open"),
  list(Day: "Tuesday", Time: "10:30AM-7:30 PM", open:"Open"),
  list(Day: "Tuesday", Time: "10:30AM-7:30 PM", open:"Open"),
  list(Day: "Wednesday", Time: "10:30AM-7:30 PM", open:"Open"),
  list(Day: "Wednesday", Time: "10:30AM-7:30 PM", open:"Open"),
  list(Day: "Thursday", Time: "10:30AM-7:30 PM", open:"Open"),
  list(Day: "Thursday", Time: "10:30AM-7:30 PM", open:"Open"),
  list(Day: "Friday", Time: "10:30AM-7:30 PM", open:"Open"),
  list(Day: "Friday", Time: "10:30AM-7:30 PM", open:"Open"),
  list(Day: "Saturday", Time: "10:30AM-7:30 PM", open:"Open"),
  list(Day: "Saturday", Time: "10:30AM-7:30 PM", open:"Open"),


];
class _Lab_DetailsState extends State<Lab_info> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: CustomScrollView(physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Lab Details',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
            centerTitle: true,
            leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
            pinned: true,

            expandedHeight:  MediaQuery.of(context).size.height / 2,
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25.r),
              ),
            ),
            backgroundColor: Color(0xFFf0f4f7),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 80,),
                  //  SizedBox(height: 100.h,),
                  Container(height: 150.h,width: 150.w,child: Image.asset('assets/Image/lab/lab1.png',fit: BoxFit.fill,),
                  ),
                  Column(
                    children: [
                      Text("LabCity",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 17.sp),),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.location_on,color: Color(0xff6B779A)),
                          Text("Bhavnagar,Gujrat ",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A)),),

                        ],
                      ),
                      SizedBox(height: 10,),
                      InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Rating()));},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Ratings",style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff21222D)),),
                            SizedBox(height: 10,),
                            Text("4.5",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff2492EC)),),
                          ],
                        ),
                      ),
                    ],
                  ),


                ],),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About Doctor',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 17.sp)),
                        SizedBox(height: 8.h,),
                        Text('LabCity is a place equipped for experimental study in a science or for testing'
                            ' and analysis a research',
                            style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A),fontSize: 12.sp)),
                        Text('laboratory broadly : a place providing opportunity for '
                            'experimentation, observation, or practice in a field of study.',
                            style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A),fontSize: 12.sp)),
                        SizedBox(height: 8.h),

                        SizedBox(height: 8.h),
                        Text("Timings",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff21222D),fontSize: 18.sp),),
                        SizedBox(height: 8.h),
                        Text("Days/Time",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff2492EC),fontSize: 15.sp),),

                        ListView.builder( shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                            itemCount: choices.length,
                            itemBuilder: (BuildContext ctx, i) {
                              return   Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(choices[i].Day,style: TextStyle(fontFamily: 'Circular Std Book',color: Color(0xff21222D),fontSize: 15.sp)),
                                    Text(choices[i].Time,style: TextStyle(fontFamily: 'Circular Std Book',decoration: TextDecoration.underline,color: Color(0xff21222D),fontSize: 15.sp)),
                                    Text(choices[i].open,style: TextStyle(fontFamily: 'Circular Std Book',color: Color(0xff21222D),fontSize: 15.sp)),

                                  ],
                                ),
                              );}),
                        SizedBox(height: 8.h),
                        Text("Contact Details",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff21222D),fontSize: 18.sp),),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            Image.asset('assets/Image/icons/mail.png',height: 18.h,),
                            SizedBox(width: 15,),
                            Text("abc123@gmail.com",style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff6B779A),fontSize: 15.sp),),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            Image.asset('assets/Image/icons/contact.png',height: 18.h,),
                            SizedBox(width: 15,),
                            Text("+91 9898989898",style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff6B779A),fontSize: 15.sp),),
                          ],),
                        SizedBox(height: 15.h),
                        Text("Address",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 15.sp),),
                        SizedBox(height: 8.h,),
                        Text('Shilpgram Complex,Sant kanvar Ram chowk ,'
                            'kalanala,Bhavnagar,Gujarat 364001,India',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A),fontSize: 12.sp)),
                        SizedBox(height: 8.h,),
                        Container(height:150 ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
                          child: Image.asset('assets/Image/lab and doc/Map.png'),),
                      ],

                    ),
                  ),

                ]


            ),),


        ],
      ),
    );
  }
}

