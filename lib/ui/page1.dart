import 'package:doctor_1/ui/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class p1 extends StatefulWidget {
  const p1({Key? key}) : super(key: key);

  @override
  State<p1> createState() => _p1State();
}

class _p1State extends State<p1> {
  @override
  Widget  build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
     // debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _delay createState() => _delay();
}
class _delay extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) =>
                    p2()
                )
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0XFF2492EC),
      body:

      CustomScrollView(physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              fillOverscroll: true,
              hasScrollBody: false,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // InkWell(onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>p2(),));},
                        SizedBox(
                          height: 261.69,
                          width: 234.01,

                          child: Column(
                            children: [
                              SizedBox(
                                height: 138.68,
                                width: 149.87,
                                child: Image.asset(
                                    'assets/Image/icons/spl.png',filterQuality: FilterQuality.high,),
                              ),
                              const SizedBox(height: 26.65,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SizedBox(
                                    height: 60,
                                    child: FittedBox(fit: BoxFit.fill,
                                      child: Text('Well Set', style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Oxygen Bold',
                                        fontSize: 40,)),), //('WELL SET',style:TextStyle(fontSize: 36 ),),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15.03,),
                              Row(
                                children: const [Expanded(
                                  child: SizedBox(
                                    height: 20,
                                    child: FittedBox(fit: BoxFit.fill,
                                      child: Text('Appointment Booking App',
                                          style: TextStyle(color: Colors.white,
                                              fontFamily: "Oxygen Bold")),), //('WELL SET',style:TextStyle(fontSize: 36 ),),
                                  ),
                                ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //   ),
                      ],
                    ),
                  ),
                ],
              ),

            )
          ]
      ),
    );
  }
}
