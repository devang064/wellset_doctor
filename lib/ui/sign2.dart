// import 'package:doctor/page3.dart';
import 'package:doctor_1/ui/homedoc.dart';
import 'package:doctor_1/ui/page4.dart';
import 'package:doctor_1/ui/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'dart:async';
// import 'package:timer_button/timer_button.dart';
class s2 extends StatefulWidget {
  const s2({Key? key}) : super(key: key);

  @override
  _p3State createState() => _p3State();
}


class _p3State extends State<s2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(centerTitle: true,title: ( const Text("Verification",style: TextStyle(color: Colors.black))),
        backgroundColor: (Colors.transparent),
        elevation: 0.0,
        leading: IconButton(onPressed: () { Navigator.pop(context,MaterialPageRoute(builder: (builder)=>const p4()),); }, icon:const Icon( Icons.arrow_back,color: Colors.black,)),),
      body:
      Padding(padding: const EdgeInsets.only(left:16 ,right:16 ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 54,),
            Container(
              child: Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:const [
                  Text("Enter",style: TextStyle(fontSize: 28,),),
                  Text("Verification Code",style: TextStyle(fontSize: 28),),
                ],  ),),
            const SizedBox(height: 7,),
            Container(child:
            const Text('Your Code Will Expire In',style: TextStyle(fontSize: 15,color: Colors.black26),textAlign: TextAlign.center,),
            ),
            const SizedBox(
              height: 35.47,
            ),
            Column(
              children: [
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Colors.black26,
                  fillColor: Colors.blue,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                  },


                  onSubmit: (String verificationCode){

                  }, // end onSubmit
                ),
              ],
            ),



            const SizedBox(height: 25,),
            Row(
              children: [
                Expanded(
                  child:
                  FlatButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: InkWell(onTap: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home1()));
                                },
                                child: Center(
                                  child: Column(
                                      children:[
                                        Image.asset('assets/Image/Group 16820.jpg',
                                          width: 50, height: 50, fit: BoxFit.contain,),
                                        const Text('Registration Successfull'),
                                        Text('Congratulations, Your successfully registration.',textAlign: TextAlign.center,style: TextStyle(color:Colors.black26 ),),

                                      ]
                                  ),
                                ),
                              ),
                              //  title: Text("Verification Code"),


                            );

                          }
                      );
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
                    }, height: 49,
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius. circular(10)),
                    child: const Text("Verify",style: const TextStyle(color: Colors.white)),
                  ),

                ),
              ],
            ),


          ],
        ),
      ),

    );
  }
}
