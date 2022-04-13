import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class Edit_numotp extends StatefulWidget {
  const Edit_numotp({Key? key}) : super(key: key);

  @override
  State<Edit_numotp> createState() => _Edit_numotpState();
}

class _Edit_numotpState extends State<Edit_numotp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (Text("Verify", style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),)),
        backgroundColor: (Colors.transparent),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                  context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body:  SingleChildScrollView(physics: BouncingScrollPhysics(),
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
                                  child: InkWell(onTap: (){
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                    splashColor: Colors.transparent,highlightColor: Colors.transparent,
                                    child: Column(
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset('assets/Image/Group 16820.jpg',
                                              width: 50, height: 50, fit: BoxFit.contain,),
                                          ),
                                          const Text('Number Changed Successfully',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat SemiBold'),),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Congratulations, your mobile number has been successfully changed ',
                                              textAlign: TextAlign.center,style: TextStyle(color:Colors.black26 ,fontSize: 12,fontFamily: 'Montserrat Medium'),),
                                          ),

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
      ),
    );
  }
}
