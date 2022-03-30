import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class catagoryfilters extends StatefulWidget {
  const catagoryfilters({Key? key}) : super(key: key);

  @override
  _doclistState createState() => _doclistState();
}

class _doclistState extends State<catagoryfilters> {
  List<Map> availableHobbies = [
    {"name": "Near by", "isChecked": false},
    // {"name": "Cardiologist", "isChecked": false},
    // {"name": "Psychologist","isChecked": false,},
    // {"name": "Opthalmologist", "isChecked": false},
    // {"name": "Pulmonologist", "isChecked": false}
  ];
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{

      };

      return Colors.blue;
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text("Filters",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
        actions: <Widget>[
          //IconButton
          TextButton(child:Text('Reset',style: TextStyle(fontFamily:"Montserrat SemiBold" ,color: Colors.black),),


            onPressed: () {},
          ), //IconButton
        ], //<Wid
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(alignment: Alignment.bottomLeft,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [


                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Clear all'),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(child:
                ElevatedButton(
                  onPressed: () {Navigator.pop(context);},
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Apply'),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius

                    ),
                  ),
                ),
                ),
              ],
            ),
          ],
        ),
      ),

      body:
      SingleChildScrollView(physics: BouncingScrollPhysics(),
          child:
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 10.h,),

                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("View By",style: TextStyle(fontFamily: "Montserrat Bold",fontSize: 20.sp,),),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Container(height: 1.h,color: Colors.black38,),
                  SizedBox(height:15.h),
                  Column(
                      children: availableHobbies.map((hobby) {
                        return CheckboxListTile(
                            value: hobby["isChecked"],
                            title: Text(hobby["name"],style: TextStyle(fontSize: 16.sp,fontFamily: 'Montserrat Medium'),),
                            onChanged: (newValue) {
                              setState(() {
                                hobby["isChecked"] = newValue;
                              });
                            });
                      }).toList()),
                  SizedBox(height: 15.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Ratings",style: TextStyle(fontFamily: "Montserrat Bold",fontSize: 20.sp,),),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Container(height: 1.h,color: Colors.black38,),
                  SizedBox(height:15.h),
                  RatingBar.builder(itemSize: 55,
                    ignoreGestures: false,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),


                ],

              )
          )

      ),

    );
  }
}


