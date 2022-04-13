import 'package:flutter/material.dart';

import 'Edit_numotp.dart';
class Edit_num extends StatefulWidget {
  const Edit_num({Key? key}) : super(key: key);

  @override
  State<Edit_num> createState() => _Edit_numState();
}

class _Edit_numState extends State<Edit_num> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (Text("Change Mobile Number", style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),)),
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
      body:
      SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Padding(padding: const EdgeInsets.only(left:16 ,right:16 ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 54,),
              Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:const [
                  Text("Enter",style: TextStyle(fontSize: 28,fontFamily: "Montserrat "),),
                  Text("Your Number",style: TextStyle(fontSize: 28,fontFamily: "Montserrat "),),
                ],  ),
              const SizedBox(height: 7,),
              const Text('you will receive 6 digit verification code',style: TextStyle(fontSize: 15,color: Colors.black26,fontFamily: "Montserrat"),textAlign: TextAlign.start,),
              const SizedBox(
                height: 35.47,
              ),
              const Text("Phone Number",style:  TextStyle(fontSize:18,color: Colors.black12,fontFamily: "Montserrat" ,),),
              SizedBox(height: 10,),
              TextFormField(
                keyboardType: TextInputType.phone,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),),
              // const SizedBox(height: 49,
              //   child: TextField(
              //       keyboardType: TextInputType.number,
              //       textAlign: TextAlign.start
              //   ),
              // ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  Expanded(
                    child:
                    FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Edit_numotp()));
                      }, height: 49,
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius. circular(10)),
                      child: const Text("Get OTP",style: TextStyle(color: Colors.white,fontFamily: "Montserrat SemiBold")),
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
