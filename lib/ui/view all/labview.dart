import 'package:doctor_1/ui/view%20all/labdetails.dart';
import 'package:flutter/material.dart';
class labview extends StatefulWidget {
  const labview({Key? key}) : super(key: key);

  @override
  _labviewState createState() => _labviewState();
}

class _labviewState extends State<labview> {
  Widget container3(String imglab,String i1,String i2,String i3,){
    return

      Container(
        width: 160,height: 200,
        child: Card(child:InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Lab_Details()));},borderRadius: BorderRadius.circular(8),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(imglab,height: 100,),
              Text(i1,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat SemiBold"),),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,size: 13,),
                  Text(i2,style: TextStyle(fontFamily:"Montserrat Medium" ),),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                  Text(i3,style: TextStyle(fontFamily: "Montserrat Medium",fontSize:12,color: Colors.black54 ),),
                ],)

            ],),),
          //   semanticContainer: true,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // elevation: 5,
          margin: EdgeInsets.all(10),
        ),
      );}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text('Featured Lab',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),),
      body:
        SingleChildScrollView(physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(

              children: <Widget>[
                container3( "assets/Image/lab/lab1.png","LabCity", "Bhavnagar,gujrat", "4.3(130 reviews)"),
                container3( "assets/Image/lab/lab2.png","LabCity", "Bhavnagar,gujrat", "4.5(150 reviews)"),
                container3( "assets/Image/lab/lab3.png","LabCity", "Bhavnagar,gujrat", "4.5(160 reviews)"),
                container3( "assets/Image/lab/lab4.png","LabCity", "Bhavnagar,gujrat", "4.5(200 reviews)"),
                container3( "assets/Image/icons/lab1.png","LabCity", "Bhavnagar,gujrat", "4.5(130 reviews)"),
                container3( "assets/Image/lab and doc/lab.png","LabCity", "Bhavnagar,gujrat", "4.5(130 reviews)"),
                container3( "assets/Image/lab/lab1.png","LabCity", "Bhavnagar,gujrat", "4.3(130 reviews)"),
                container3( "assets/Image/lab/lab2.png","LabCity", "Bhavnagar,gujrat", "4.5(150 reviews)"),
                container3( "assets/Image/lab/lab3.png","LabCity", "Bhavnagar,gujrat", "4.5(160 reviews)"),
                container3( "assets/Image/lab/lab4.png","LabCity", "Bhavnagar,gujrat", "4.5(200 reviews)"),
                container3( "assets/Image/icons/lab1.png","LabCity", "Bhavnagar,gujrat", "4.5(130 reviews)"),
                container3( "assets/Image/lab and doc/lab.png","LabCity", "Bhavnagar,gujrat", "4.5(130 reviews)"),
              ],),
          ),
        ),

    );
  }
}
