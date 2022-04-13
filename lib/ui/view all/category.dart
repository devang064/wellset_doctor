import 'package:doctor_1/ui/catagorytabview.dart';
import 'package:doctor_1/ui/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text('Category',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder( physics: BouncingScrollPhysics(),shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
     crossAxisCount: 3,
    crossAxisSpacing: 8.w,
    mainAxisSpacing: 8.h,),
            itemCount: choices.length,
            itemBuilder: (BuildContext ctx, i) {
              return Container(
                          alignment: Alignment.center,
              child: Padding(
              padding: EdgeInsets.all(5),
              child: Container(
              width: 110.w,height: 110.h,
              child: Card(
              child:InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>tabcat()));},borderRadius: BorderRadius.circular(8),
              child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                            Image.asset(choices[i].image,height: 30.h,),
                            Text(choices[i].title,style: TextStyle(fontFamily: "Montserrat Semibold",fontSize:12.sp ),),
                          ],
                        ) ,),
                      //   semanticContainer: true,
                      // clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: choices[i].color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // elevation: 5,
                      margin: EdgeInsets.all(0),
                    ),
                  ),
                ),
              );
            }),
      ),

    );
  }
}
class Choice {
  const Choice({required this.title, required this.image,required this.color});
  final String title;
  final String image;
  final Color color;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Dentist', image: 'assets/Image/icons/redh.png',color: Color(0xFFfadcd4)),
  Choice(title: 'Cardiologist', image: 'assets/Image/icons/brain.png',color:Color(0xFFfae7ca), ),
  Choice(title: 'Psychologist', image: 'assets/Image/icons/eye.png',color:Color(0xFFedfff6), ),
  Choice(title: 'Opthalmologist', image: 'assets/Image/icons/lungs.png',color:Color(0xFFddffd6), ),
  Choice(title: 'pulmonologist', image: 'assets/Image/icons/teeth.png',color:Color(0xFFe3effa), ),
  Choice(title: 'Dentist', image: 'assets/Image/icons/redh.png',color: Color(0xFFfadcd4),),
  Choice(title: 'Dentist', image: 'assets/Image/icons/redh.png',color:Color(0xFFfadcd4), ),
  Choice(title: 'Dentist', image: 'assets/Image/icons/redh.png',color:Color(0xFFfadcd4), ),
];

class SelectCard extends StatelessWidget {
  const SelectCard({required Key key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        width: 110.w,height: 110.h,
        child: Card(
          child:InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>doctor()));},borderRadius: BorderRadius.circular(8),
            child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(choice.image,height: 30.h,),
                Text(choice.title,style: TextStyle(fontFamily: "Montserrat Semibold",fontSize:12.sp ),),
              ],
            ) ,),
          //   semanticContainer: true,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          color: choice.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // elevation: 5,
          margin: EdgeInsets.all(0),
        ),
      ),
    );
  }
}



// Container(
// alignment: Alignment.center,
// child: Padding(
// padding: EdgeInsets.all(5),
// child: Container(
// width: 110.w,height: 110.h,
// child: Card(
// child:InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>doctor()));},borderRadius: BorderRadius.circular(8),
// child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Image.asset(choices[i].image,height: 30.h,),
// Text(choices[i].title,style: TextStyle(fontFamily: "Montserrat Semibold",fontSize:13.sp ),),
// ],
// ) ,),
// //   semanticContainer: true,
// // clipBehavior: Clip.antiAliasWithSaveLayer,
// color: choices[i].color,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10),
// ),
// // elevation: 5,
// margin: EdgeInsets.all(0),
// ),
// ),
// ),
// );
// }),
// ),
