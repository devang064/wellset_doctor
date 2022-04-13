import 'package:flutter/material.dart';
import 'package:doctor_1/ui/login%20for%20booking/otp_book.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class otp_book extends StatefulWidget {
  const otp_book({Key? key}) : super(key: key);

  @override
  State<otp_book> createState() => _otp_bookState();
}

class _otp_bookState extends State<otp_book> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(centerTitle: true,title: ( const Text("Verification",style: TextStyle(color: Colors.black))),
        backgroundColor: (Colors.transparent),
        elevation: 0.0,
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon:const Icon( Icons.arrow_back,color: Colors.black,)),),
      body:
      SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Padding(padding: const EdgeInsets.only(left:16 ,right:16 ),
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
              const Text('Your Code Will Expire In',style: TextStyle(fontSize: 15,color: Colors.black26),textAlign: TextAlign.center,),
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
                    fieldWidth: 45,


                    borderRadius: BorderRadius.circular(8),
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
                                title: Center(
                                  child: InkWell(onTap: (){Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);},splashColor: Colors.transparent,highlightColor: Colors.transparent,
                                    child: Column(
                                        children:[
                                          Image.asset('assets/Image/Group 16820.jpg',
                                            width: 50, height: 50, fit: BoxFit.contain,),
                                          Padding(padding: EdgeInsets.only(bottom: 10)),
                                          const Text('Appointment Booking Successfull',textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 16,fontFamily: 'Montserrat SemiBold',color: Colors.black)),
                                          Text('Congratulations, Your have successfully booked an appointment.',
                                            textAlign: TextAlign.center,style: TextStyle(color:Colors.black26 ,fontSize: 12,fontFamily: 'Montserrat Medium'),),

                                        ]
                                    ),
                                  ),
                                ),
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
      ),

    );
  }
}
