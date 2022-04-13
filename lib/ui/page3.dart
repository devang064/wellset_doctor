import 'package:doctor_1/ui/page4.dart';
import 'package:doctor_1/ui/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
class p3 extends StatefulWidget {
  const p3({Key? key}) : super(key: key);

  @override
  _p3State createState() => _p3State();
}

class _p3State extends State<p3> {
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(physics: BouncingScrollPhysics(),
    slivers: [
    SliverFillRemaining(
    fillOverscroll: true,
    hasScrollBody: false,
          child:
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:16 ,left: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                      Container(
                        height: 300,
                        child: Image.asset('assets/Image/Group 93057.png'),
                      ),
                      SizedBox( height:25),
                      Text('Welcome to Wellset',style:TextStyle(fontSize: 31 ,fontFamily: "Montserrat SemiBold") ,),
                      SizedBox(height: 6),
                      Text("Instantly Connect With Doctors Around You!",style: TextStyle(fontSize: 15,color: Colors.black26,fontFamily: "Montserrat"),),
                      SizedBox(height: 15,),

                          Row(
                           children: [
                             Expanded(
                               child:
                                 FlatButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>p4()));
                                      }, height: 49,
                                      color: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius. circular(10)),
                                      child: Text("Login",style: TextStyle(color: Colors.white,fontFamily: "Montserrat Bold")),

                      ),

                             ),
                           ],
                         ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Expanded(
                            child:
                            FlatButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>p6()));
                              }, height: 49,
                             // color: Colors.white,
                              splashColor: null,

                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black12),
                                  borderRadius: BorderRadius. circular(10),),
                              child: Text("Sign up",style: TextStyle(color: Colors.black,fontFamily: "Montserrat Bold")),

                            ),

                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/Image/facebook.png"),
                          ),
                          Padding(padding: EdgeInsets.only(left: 25)),
                          CircleAvatar(
                            backgroundImage:  AssetImage("assets/Image/Apple.png"),
                          ),
                          Padding(padding: EdgeInsets.only(right: 25)),
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/Image/google.png"),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),
            TextButton(onPressed: (){},child:Text("Guest User",style: TextStyle(fontFamily: "Montserrat "),) ,),

                      Padding(padding: EdgeInsets.only(bottom: 16)),
                      Text('Terms & Condition | Privacy Policy',style: TextStyle(fontFamily: "Montserrat "),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          )])
        );
  }
}
