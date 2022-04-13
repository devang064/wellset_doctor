import 'package:doctor_1/ui/homedoc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Lab_appointdet extends StatefulWidget {
  const Lab_appointdet({Key? key}) : super(key: key);

  @override
  State<Lab_appointdet> createState() => _Lab_appointdetState();
}

class _Lab_appointdetState extends State<Lab_appointdet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text('Appointment Detail',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),

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
                                child: Image.asset('assets/Image/lab/lab2.png'),
                              ),
                            ),
                            Padding(padding:EdgeInsets.only(right: 10)),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'LabCity', style: TextStyle(fontFamily: "Montserrat Bold",fontSize: 16.sp),),
                                Padding(padding: EdgeInsets.only(bottom: 5)),
                                Row(
                                  children: [Icon(Icons.location_on_sharp,size:17 ,color: Color(0xff6B779A)),
                                    Text('Bhavnagar,Gujrat',style: TextStyle(fontFamily: "Montserrat SemiBold",color: Color(0xff6B779A)),),
                                  ],
                                ),
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
                                    Text(it[i].time,style: TextStyle(fontFamily: "Montserrat SemiBold",color: Color(0xff6B779A))),
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
              Padding(padding: EdgeInsets.only(bottom: 5)),
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
  const droplist( { required this.Title,required this.time,});

  final String Title;
  final String time;


}

const List<droplist> it = <droplist>[
  droplist(Title: 'Appointment date', time: '27th Oct, 2021',),
  droplist(Title: 'Appointment time', time: '11:30 am', ),
  droplist(Title: 'Mobile Number', time: '+91 9434 239 456', ),


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