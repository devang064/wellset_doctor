import 'package:doctor_1/page3.dart';
import 'package:doctor_1/page4.dart';
import 'package:doctor_1/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class p2 extends StatefulWidget {
  p2({Key? key}) : super(key: key);

  @override
  State<p2> createState() => _p2State();
}

class _p2State extends State<p2> {
  final int numPages = 2;

   final pageController = PageController(initialPage: 0);

  late int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 34, left: 16),
          child: SizedBox(
            height: 49,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage == 2) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const p3()));
                    } else {
                      pageController.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.linear,
                      );
                    }
                  },
                  child: Text(
                    _currentPage == 2 ? 'continue' : 'next',
                    style: const TextStyle(
                        color: Colors.white, fontFamily: "Montserrat SemiBold"),
                  ),
                )
              ],
            ),
          ),
        ),
        body:

            //child:
            Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            // skip(),

            PageView(
              controller: pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                Container(
                  child: SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, right: 16, left: 16),
                      child: Column(
                        children: [
                          // Row(mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     SizedBox(
                          //       height: 19,
                          //       child: TextButton(onPressed: (){},child: Text('skip',style: TextStyle(fontSize:19,color:Colors.black,fontWeight: FontWeight.bold),),
                          //     ),),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 51.6,
                          ),
                          Image.asset(
                            'assets/Image/Group 93055.png',
                            filterQuality: FilterQuality.high,
                          ),
                          const SizedBox(
                            height: 51,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 89,
                                // width: MediaQuery.of(context).size.width,
                                //child: Padding(
                                //   padding:  EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                        height: 34,
                                        child: Text("Let's Consult",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 34,
                                                fontFamily:
                                                    "Montserrat Bold"))),
                                    SizedBox(
                                      height: 34,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text("The",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 34,
                                                  fontFamily:
                                                      "Montserrat Bold")),
                                          Text(' Best Doctor',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 34,
                                                  fontFamily:
                                                      "Montserrat Bold")),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                //   ),
                                //  child: Text("Let's Consult",style: TextStyle(fontSize: 71),),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //     Padding(
                              //     padding: const EdgeInsets.only(left: 16),
                              // child:
                              SizedBox(
                                height: 45,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    (Text(
                                      "Lorem Ipsum is simply dummy text of the",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black26,
                                          fontFamily: "Montserrat Medium"),
                                    )),
                                    (Text(
                                      "printing and typesetting industry.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black26,
                                          fontFamily: "Montserrat Medium"),
                                    )),
                                  ],
                                ),
                              ),
                              //   ),
                            ],
                          ),
                          // Container(height: 49,
                          //   child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: (CrossAxisAlignment.end),
                          //     children: [
                          //   Container(height:5,width:27,
                          //     child:Image.asset('assets/Image/img.png',),
                          //   ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, right: 16, left: 16),
                      child: Column(
                        children: [
                          // Row(mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     SizedBox(
                          //       height: 19,
                          //       child: TextButton(onPressed: (){},child: Text('skip',style: TextStyle(fontSize:19,color:Colors.black,fontWeight: FontWeight.bold),),
                          //       ),),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 51.6,
                          ),
                          Container(
                            child: Image.asset('assets/Image/Group 92866.png',filterQuality: FilterQuality.high),
                          ),
                          const SizedBox(
                            height: 51,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 89,
                                // width: MediaQuery.of(context).size.width,
                                //child: Padding(
                                //   padding:  EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                        height: 34,
                                        child: Text("Let's Consult",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 34,
                                                fontFamily:
                                                    "Montserrat Bold"))),
                                    SizedBox(
                                      height: 34,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text("The",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 34,
                                                  fontFamily:
                                                      "Montserrat Bold")),
                                          Text(' Best Doctor',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 34,
                                                  fontFamily:
                                                      "Montserrat Bold")),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                //   ),
                                //  child: Text("Let's Consult",style: TextStyle(fontSize: 71),),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //     Padding(
                              //     padding: const EdgeInsets.only(left: 16),
                              // child:
                              SizedBox(
                                height: 45,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    (Text(
                                      "Lorem Ipsum is simply dummy text of the",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black26,
                                          fontFamily: "Montserrat Medium"),
                                    )),
                                    (Text(
                                      "printing and typesetting industry.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black26,
                                          fontFamily: "Montserrat Medium"),
                                    )),
                                  ],
                                ),
                              ),
                              //   ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, right: 16, left: 16),
                    child: Column(
                      children: [

                        const SizedBox(
                          height: 51.6,
                        ),
                        SizedBox(
                          child: Image.asset('assets/Image/Group 93056.png',filterQuality: FilterQuality.high),
                        ),
                        const SizedBox(
                          height: 51,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 89,
                              // width: MediaQuery.of(context).size.width,
                              //child: Padding(
                              //   padding:  EdgeInsets.only(left: 16),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                      height: 34,
                                      child: Text("Let's Consult",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 34,
                                              fontFamily:
                                                  "Montserrat Bold"))),
                                  SizedBox(
                                    height: 34,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text("The",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 34,
                                                fontFamily:
                                                    "Montserrat Bold")),
                                        Text(' Best Doctor',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 34,
                                                fontFamily:
                                                    "Montserrat Bold")),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //   ),
                              //  child: Text("Let's Consult",style: TextStyle(fontSize: 71),),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //     Padding(
                            //     padding: const EdgeInsets.only(left: 16),
                            // child:
                            SizedBox(
                              height: 45,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  (Text(
                                    "Lorem Ipsum is simply dummy text of the",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black26,
                                        fontFamily: "Montserrat Medium"),
                                  )),
                                  (Text(
                                    "printing and typesetting industry.",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black26,
                                        fontFamily: "Montserrat Medium"),
                                  )),
                                ],
                              ),
                            ), //   ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 5,
              right: 10,
              child: TextButton(
                onPressed: () {
                  setState(() {
                   _currentPage=2;
                  });
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(fontFamily: "Montserrat SemiBold",color: Colors.black,),
                  // TextButton.styleFrom(
                  //     splashFactory: NoSplash.splashFactory
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//    class skip extends StatefulWidget {
//      const skip({Key? key}) : super(key: key);
//
//   @override
//   State<skip> createState() => _skipState();
// }

// class _skipState extends State<skip> {
//   get pageController =>p2() ;
//
//      @override
//      Widget build(BuildContext context) {
//        return Row(mainAxisAlignment: MainAxisAlignment.end,
//          children: [
//            InkWell(onTap: (){
//              pageController.jumpToPage(3);
//        //      pageController.nextPage(duration: const Duration(microseconds: 500), curve:Curves.linear,);
//      },
//              child: Container(padding: const EdgeInsets.only(right: 16),
//                height: 25,
//                child: const Text('skip',
//                  style: TextStyle(fontSize:19,color:Colors.black,fontWeight: FontWeight.bold),),),
//            ),
//          ],
//        );
//      }
// }
