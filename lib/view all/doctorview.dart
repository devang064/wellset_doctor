import 'package:doctor_1/view%20all/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class doclist extends StatefulWidget {
  const doclist({Key? key}) : super(key: key);

  @override
  _doclistState createState() => _doclistState();
}
class Doctorlist {
  const Doctorlist({ required this.image,required this.name,required this.Catagory,required this.reviws});

  final String image;
  final String name;
  final String Catagory;
  final String reviws;
}

const List<Doctorlist> choices = <Doctorlist>[
  Doctorlist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', Catagory: 'Dentist', reviws: '4.3(130 reviews)'),
  Doctorlist(image: 'assets/Image/doc/doc2.png', name: 'Dr jagdish', Catagory: 'Cardiologist', reviws: '4.3(130 reviews)'),
  Doctorlist(image: 'assets/Image/doc/doc3.png', name:'Dr joy', Catagory: 'Psychologist', reviws: '4.3(130 reviews)'),
  Doctorlist(image: 'assets/Image/doc/doc4.png', name: 'Dr watt', Catagory: 'Opthalmologist', reviws:'4.3(130 reviews)'),
  Doctorlist(image: 'assets/Image/doc/doc5.png', name: 'Dr.robert', Catagory: 'pulmonologist', reviws: '4.3(130 reviews)'),
  Doctorlist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', Catagory: 'Dentist', reviws: '4.3(130 reviews)'),
  Doctorlist(image:'assets/Image/doc/doc4.png', name: 'Dr robert', Catagory: 'Dentist', reviws: '4.3(130 reviews)'),

];
class _doclistState extends State<doclist> {
  //Widget container2(String imgdoc,String i1,String i2,String i3,){
    //return

      // Container(
      //   width: 160,height: 210,
      //   child: Card(
      //     child: InkWell(onTap: (){},borderRadius: BorderRadius.circular(8),
      //       child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Image.asset(imgdoc,height: 100,),
      //           Text(i1,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat SemiBold"),),
      //           Text(i2,style: TextStyle(fontFamily: "Montserrat Medium"),),
      //           Row(mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
      //               Text(i3,style: TextStyle(fontFamily: "Montserrat Medium",color: Colors.black54,fontSize: 12),),
      //             ],)
      //
      //         ],),
      //     ),
      //     //   semanticContainer: true,
      //     // clipBehavior: Clip.antiAliasWithSaveLayer,
      //     color: Colors.white,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10.0),
      //     ),
      //     // elevation: 5,
      //     margin: EdgeInsets.all(10),
      //   ),
      // );}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
    centerTitle: true,
    title: Text('Featured doctor',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
    leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
    ),
    body:
     SingleChildScrollView(physics: BouncingScrollPhysics(),
       child:
       Padding(
         padding: const EdgeInsets.all(10.0),
         child: GridView.builder( physics: BouncingScrollPhysics(),shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
             childAspectRatio: 11/13,
             crossAxisSpacing: 0.h,
              mainAxisSpacing: 0.h,),
            itemCount: choices.length,
            itemBuilder: (BuildContext ctx, i) {
              return
                Container(

                  child: Card(
                    child: InkWell(onTap: (){},borderRadius: BorderRadius.circular(0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(choices[i].image,height: 100,),
                          Text(choices[i].name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat SemiBold"),),
                          Text(choices[i].Catagory,style: TextStyle(fontFamily: "Montserrat Medium"),),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                              Text(choices[i].reviws,style: TextStyle(fontFamily: "Montserrat Medium",color: Colors.black54,fontSize: 12),),
                            ],)

                        ],),
                    ),
                    //   semanticContainer: true,
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                );

            }),
       ),
    ),


    );
    }
    }



