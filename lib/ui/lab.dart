
import 'package:doctor_1/ui/view%20all/labdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Lab extends StatefulWidget {
  const Lab({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Lab> {

  Widget CardTheme( String Img, String text1,String text2,String text3,)
  {
    return    Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: Card(child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context) =>Lab_Details() ));},
        child: Padding(padding: EdgeInsets.all(10),child: Row(children: [
          Padding(
            padding:  EdgeInsets.only(right:10 ),
            child: Image.asset(Img),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(text1,style: TextStyle(fontFamily: "Montserrat Bold",)),
              SizedBox(height: 5,),
              Row(
                children: [Icon(Icons.location_on_sharp,size:17 ,),
                  Text(text2,style: TextStyle(fontFamily: "Montserrat SemiBold"),),
                ],
              ),
              SizedBox(height: 5,),
              Row(children: [
                Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                Text(text3,style: TextStyle(fontFamily: "Montserrat Medium",fontSize:12,color: Colors.black54 ),),
              ],),
            ],
          ),
        ],),),
      ),),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
          centerTitle: true,
          title: Text('Lab',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
          leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
        ),
        body:Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              height: 55,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.transparent,border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),

                        boxShadow: [
                          BoxShadow(
                            //  offset: Offset(0, 3),
                            // blurRadius: 5,
                              color: Colors.transparent)
                        ],
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.search , color: Colors.blueAccent,), onPressed: () {}),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Type Something...",
                                  hintStyle: TextStyle( color:     Colors.black54),
                                  border: InputBorder.none),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  // SizedBox(width: 15),
                  // Container(
                  //   padding: const EdgeInsets.all(15.0),
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(8),border: Border.all( color: Colors.black45)),
                  //   child: InkWell(
                  //     child: Icon(
                  //       Icons.add_road,
                  //       color: Colors.black54,
                  //     ),
                  //     onTap: () {
                  //     },
                  //   ),
                  // )
                ],
              ),
            ) ,

            Container(
              child: Expanded(
                child: ListView(physics: BouncingScrollPhysics(),
                    children: [

                      CardTheme('assets/Image/lab/lab1.png', 'LabCity', 'Bhavnagar,Gujrat', '4.5(400 Reviews)'),
                      CardTheme('assets/Image/lab/lab2.png', 'LabCity', 'Bhavnagar,Gujrat', '4.5(400 Reviews)'),
                      CardTheme('assets/Image/lab/lab3.png', 'LabCity', 'Bhavnagar,Gujrat', '4.5(400 Reviews)'),
                      CardTheme('assets/Image/lab/lab4.png', 'LabCity', 'Bhavnagar,Gujrat', '4.5(400 Reviews)'),
                      CardTheme('assets/Image/lab/lab3.png', 'LabCity', 'Bhavnagar,Gujrat', '4.5(400 Reviews)'),
                      CardTheme('assets/Image/lab/lab1.png', 'LabCity', 'Bhavnagar,Gujrat', '4.5(400 Reviews)'),
                      CardTheme('assets/Image/lab/lab2.png', 'LabCity', 'Bhavnagar,Gujrat', '4.5(400 Reviews)'),
                      CardTheme('assets/Image/lab/lab3.png', 'LabCity', 'Bhavnagar,Gujrat', '4.5(400 Reviews)'),
                      CardTheme('assets/Image/lab/lab4.png', 'LabCity', 'Bhavnagar,Gujrat', '4.5(400 Reviews)'),
                        ]),),),
          ],
        )

    );//]),);
  }
}
