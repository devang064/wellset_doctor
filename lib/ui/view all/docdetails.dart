import 'package:doctor_1/ui/view%20all/Review_and_Ratings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctor_time.dart';
class Doctor_Details extends StatefulWidget {
  const Doctor_Details({Key? key}) : super(key: key);

  @override
  _Doctor_DetailsState createState() => _Doctor_DetailsState();
}
//Color(0xFFf0f4f7),
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
class _Doctor_DetailsState extends State<Doctor_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(right: 8,left: 8),
          child: FlatButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Doc_time()));},child: Text('Book Appointment',style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
            color: Color(0xff2492EC),height: 40,shape:RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.r),),
      ),
        ),),


      body: CustomScrollView(physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
          title: Text('Doctor Details',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
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
                  Container(height: 100.h,width: 100.w,child: Image.asset('assets/Image/doc/doc1.png',fit: BoxFit.fill,),
                  ),
                  Column(
                    children: [
                      Text("Dr. Bellamy N",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 17.sp),),
                      Text("Dentist",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A)),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("4.5",style: TextStyle(fontFamily: 'Montserrat Bold',color: Color(0xff21222D)),),
                          SizedBox(height: 10,),
                          Text("10 Yrs",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff2492EC)),),
                        ],
                      ),
                      Container(height: 60.h, child: VerticalDivider(color: Colors.black12)),

                      InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context)=>Rating()));},
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
            Text('Dr. Bellamy N is specifically trained to keep the teeth surgical'
                ' procedures customized according to the respective patients. The end results always'
                ' keeps the patients satisfied.',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A),fontSize: 12.sp)),
            SizedBox(height: 8.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Hospital",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff21222D),fontSize: 18.sp),),
                    SizedBox(height: 5.h,),
                    Text("Columbia Asia Hospital",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A),fontSize: 12.sp),),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Consulting Fees",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff21222D),fontSize: 18.sp),),
                    SizedBox(height: 5.h,),
                    Text("₹300",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A),fontSize: 12.sp),),
                  ],
                ),
              ],
            ),
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

