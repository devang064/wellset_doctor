import 'package:doctor_1/ui/page3.dart';
import 'package:doctor_1/ui/page4.dart';
import 'package:doctor_1/ui/page5.dart';
import 'package:doctor_1/ui/sign2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter/material.dart';

//import 'package:custom_radio/custom_radio.dart';
//import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
class p6 extends StatefulWidget {
  const p6({Key? key}) : super(key: key);

  @override
  _p6State createState() => _p6State();
}

class _p6State extends State<p6> {
  int selected = 0;
  Widget customRadio(String image,String text, int index) {
    return OutlineButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,color: (selected == index ? Colors.blue : Colors.black45)),
        //  Image.asset("assets/Image/male_selected.png",  color: (selected == index ? Colors.blue : Colors.black45)),
          SizedBox(width: 8,),
          Text(
            text,
            style: TextStyle(
                color: (selected == index ? Colors.blue : Colors.black45)),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      borderSide:
          BorderSide(color: (selected == index ? Colors.blue : Colors.black45)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (Text("Sign up", style: TextStyle(color: Colors.black))),
        backgroundColor: (Colors.transparent),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (builder) => p3()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        SliverFillRemaining(
          fillOverscroll: true,
          hasScrollBody: false,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              //   child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Full Name",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, color: Colors.black26),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      //  labelText: "Full Name",
                      hintText: "Enter your name",
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Address",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, color: Colors.black26),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Add",
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                    ),
                  ),),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Phone Number",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, color: Colors.black26),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //  labelText: "Full Name",
                      hintText: "Enter your Phone Number",
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Age",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, color: Colors.black26),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //  labelText: "Full Name",
                      hintText: "Age",
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                  //   children: [
                  //     Expanded(child:
                  //     OutlinedButton.icon(
                  //       icon: Icon(Icons.female),
                  //       label: Text("female"),
                  //       onPressed: () => print("it's pressed"),
                  //       style: ElevatedButton.styleFrom(
                  //         side: BorderSide(width: 2.0, color: Colors.blue),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(32.0),
                  //         ),
                  //       ),
                  //     ),),
                  //     Expanded(child:
                  //     OutlinedButton.icon(
                  //       icon: Icon(Icons.male),
                  //       label: Text("male"),
                  //       onPressed: () { highlightedBorderColor: Colors.blue;},
                  //       style: ElevatedButton.styleFrom(
                  //         side: BorderSide(width: 2.0, color: Colors.blue),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(32.0),
                  //         ),
                  //       ),
                  //     ),
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Gender",
                    style: TextStyle(fontSize: 18, color: Colors.black26),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: customRadio("assets/Image/male_selected.png","Male", 1),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10)),
                      Expanded(
                        child: customRadio("assets/Image/female.png","Female", 2),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => p5()));
                          },
                          height: 49,
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Sign up",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "OR",
                        style: TextStyle(color: Colors.black26),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtAAs65FYEOv0anNZoMmOhDEpKuwUDTRiCRQ&usqp=CAU"),
                      ),
                      Padding(padding: EdgeInsets.only(left: 25)),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://i0.wp.com/potsandpansbyccg.com/wp-content/uploads/2020/10/apple-logo.jpg?ssl=1"),
                      ),
                      Padding(padding: EdgeInsets.only(right: 25)),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://blog.hubspot.com/hubfs/image8-2.jpg"),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontFamily: "Montserrat SemiBold"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => p4()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: "Montserrat SemiBold"),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
