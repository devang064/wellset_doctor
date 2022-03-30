import 'package:doctor_1/login%20for%20booking/login_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Doc_Appointmentdetails extends StatefulWidget {
  const Doc_Appointmentdetails({Key? key}) : super(key: key);

  @override
  State<Doc_Appointmentdetails> createState() => _Doc_AppointmentdetailsState();
}

class _Doc_AppointmentdetailsState extends State<Doc_Appointmentdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text('Appointment Detail',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
      bottomNavigationBar:
      Container(color: Colors.transparent,
        height: 50,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(right: 8,left: 8),
          child: FlatButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>login_book()));
                },
            child: Text('Book Now',
                style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
            color: Color(0xff2492EC),height: 40,shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),),
          ),),),

      body: SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(//height: 160.h,
                  margin:  EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.7.w,
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.r))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        //SizedBox(height: 5,),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(

                              //  margin: EdgeInsets.all(0),
                              width: 70.w,
                              height: 70.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset('assets/Image/doc/doc1.png'),
                              ),
                            ),
                            Padding(padding:EdgeInsets.only(right: 10)),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. Bellamy N', style: TextStyle(fontFamily: "Montserrat Bold",fontSize: 16.sp),),
                                Padding(padding: EdgeInsets.only(bottom: 5)),
                                  Text('Dentist - Columbia Asia Hospital',style: TextStyle(fontFamily: "Montserrat SemiBold",color: Color(0xff6B779A),fontSize: 12.sp),),
                                Padding(padding: EdgeInsets.only(bottom: 5)),
                                Row(children: [
                                  Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                                  Text('4.5(400 Reviews)',style: TextStyle(fontFamily: "Montserrat Medium",fontSize:12,color: Colors.black54 ),),
                                ],),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(height: 1.h,color: Colors.black26),
                        ),
                        ListView.builder( shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                            itemCount: it.length,
                            itemBuilder: (BuildContext ctx, i) {
                              return
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(it[i].Title,style: TextStyle(fontFamily: "Montserrat SemiBold",color: Color(0xff6B779A))),
                                    Text(it[i].time,style: TextStyle(fontFamily: "Montserrat SemiBold",color:it[i].color)),
                                  ],
                                );})
                      ],
                    ),
                  ),

                ),
              ),
              Text(
                "Preference",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16,fontFamily: 'Montserrat Semibold', color: Colors.black),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              Row(
                children: [
                  Expanded(
                    child: Container(//height: 160.h,
                      //margin:  EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.7.w,
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20.r))
                        ),child: Padding(child: Text('At Lab',
                        style: TextStyle(fontSize: 16,fontFamily: 'Montserrat Semibold', color: Colors.black))
                      ,padding: EdgeInsets.all(15),)),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              Text(
                "Address",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16,fontFamily: 'Montserrat Semibold', color: Colors.black),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              Text(
                "Shilpgram Complex, Sant Kanvar Ram Chowk, Kalanala, Bhavnagar, Gujarat 364001, India",

                style: TextStyle(fontSize: 15.sp,fontFamily: 'Montserrat Semibold', color: Color(0xff6B779A)),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.h,

                decoration: BoxDecoration(
                  // border: Border.all(width: 0.7.w,
                  //   color: Colors.black12,
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),

                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/Image/lab and doc/Map.png'),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Prescription",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16,fontFamily: 'Montserrat Semibold', color: Colors.black),
              ),
              InkWell(onTap: (){
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                          content: Stack(
                            children: [

                              Image.asset(
                                'assets/Image/icons/appoint.png',
                                height: MediaQuery.of(context).size.height *0.46,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top:0.0,
                                right: 0.0,
                                child: new IconButton(
                                    icon: Image.asset('assets/Image/icons/Ax.png'),
                                    onPressed: () {Navigator.pop(context);

                                    },splashColor: Colors.transparent,highlightColor: Colors.transparent),
                              ),
                            ],
                          )

                      );

                    }
                );
                // Navigator.pop(context,MaterialPageRoute(builder: (context)=>lablocationexe()));
                },
                child: Container(
                  width: 100,
                  height: 140,

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/Image/icons/appoint.png'),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Payment Summary",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16,fontFamily: 'Montserrat Semibold', color: Colors.black),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              Container(//height: 160.h,
                margin:  EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.7.w,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.r))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Text(
                                "Payment Summary",

                                style: TextStyle(fontSize: 16,fontFamily: 'Montserrat Semibold', color: Colors.black),),
                              Padding(padding: EdgeInsets.only(bottom: 5)),
                              Text(
                                "lorem ipsum is simply",
                                style: TextStyle(fontSize: 12.sp,fontFamily: 'Montserrat Semibold', color: Color(0xff6B779A)),
                              ),
                            ],
                          ),
                          Text(
                            " ₹900",

                            style: TextStyle(fontSize: 16,fontFamily: 'Montserrat Semibold', color: Colors.blue),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(height: 1.h,color: Colors.black26),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Text(
                                "Payment Summary",

                                style: TextStyle(fontSize: 16,fontFamily: 'Montserrat Semibold', color: Colors.black),),
                              Padding(padding: EdgeInsets.only(bottom: 5)),
                              Text(
                                "lorem ipsum is simply",
                                style: TextStyle(fontSize: 12.sp,fontFamily: 'Montserrat Semibold', color: Color(0xff6B779A)),
                              ),
                            ],
                          ),
                          Text(
                            " ₹900",

                            style: TextStyle(fontSize: 16,fontFamily: 'Montserrat Semibold', color: Colors.blue),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(height: 1.h,color: Colors.black26),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Total Price",

                            style: TextStyle(fontSize: 16,fontFamily: 'Montserrat Semibold', color: Colors.black),),
                          Text(
                              " ₹1800",

                              style: TextStyle(fontSize: 16,fontFamily: 'Montserrat Semibold', color: Color(0xff6B779A))),
                        ],
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
class droplist {
  const droplist( { required this.Title,required this.time,required this.color});

  final String Title;
  final String time;
  final dynamic color;


}
const List<droplist> it = <droplist>[
  droplist(Title: 'Appointment date', time: '27th Oct, 2021',color: Color(0xff6B779A)),
  droplist(Title: 'Appointment time', time: '11:30 am',color: Color(0xff6B779A) ),
  droplist(Title: 'Mobile Number', time: '+91 9434 239 456',color: Color(0xff6B779A) ),


];
class pricelist {
  const pricelist( { required this.Title,required this.sub,required this.price});

  final String Title;
  final String sub;
  final String price;


}

const List<pricelist> list = <pricelist>[
  pricelist(Title: 'Payment Summary', sub: 'lorem ipsum is simply', price: '₹900'),
  pricelist(Title: 'Payment Summary', sub: 'lorem ipsum is simply', price: '₹900'),



];