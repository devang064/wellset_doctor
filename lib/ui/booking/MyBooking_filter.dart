import 'package:doctor_1/ui/view%20all/maplab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class MyBooking_filter extends StatefulWidget {
  const MyBooking_filter({Key? key}) : super(key: key);

  @override
  State<MyBooking_filter> createState() => _MyBooking_filterState();
}

class _MyBooking_filterState extends State<MyBooking_filter> {

  List<Map> availableHobbies = [
    {"name": "Dentist", "isChecked": false},
    {"name": "Cardiologist", "isChecked": false},
    {"name": "Psychologist","isChecked": false,},
    {"name": "Opthalmologist", "isChecked": false},
    {"name": "Pulmonologist", "isChecked": false}
  ];
  int selectedRadioTile=0;
  int selectedButton=0;
  DateTime _selectedValue = DateTime.now();
  bool _isvisible = true;

  setSelectedRadioTile(int val){
    setState(() {
      selectedRadioTile=val;
    });
  }
  setSelectedRadio(int val){
    setState(() {
      selectedButton=val;
    });
  }
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
        title: Text(" Book Filters",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
        actions: <Widget>[
          //IconButton
          TextButton(child:Text('Reset',style: TextStyle(fontFamily:"Montserrat SemiBold" ,color: Colors.black),),


            onPressed: () {},
          ), //IconButton
        ], //<Wid
      ),
      bottomNavigationBar: Container(height: 70,
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      ),),
      body:
      SingleChildScrollView(physics: BouncingScrollPhysics(),
          child:
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [

                  SizedBox(height: 15.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Ratings",style: TextStyle(fontFamily: "Montserrat Bold",fontSize: 20.sp,),),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Container(height: 1.h,color: Colors.black38,),
                  SizedBox(height:15.h),
               
                  RadioListTile(value: 1, groupValue:selectedRadioTile,
                    onChanged: (val){
                      setSelectedRadioTile(1);
                    },
                    title: Text('At lab',style: TextStyle(fontFamily: 'Montserrat Medium',color: Colors.black),),selected: true,dense: false,
                  ),
                  RadioListTile(value: 2, groupValue:selectedRadioTile,
                    onChanged: (val){
                      setSelectedRadioTile(2);
                    },
                    title: Text('At Home',style: TextStyle(fontFamily: 'Montserrat Medium',color: Colors.black),),
                    selected: false,
                    dense: false,
                  ),
                  Visibility(visible: (selectedRadioTile==2),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h,),

                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Specialist",style: TextStyle(fontFamily: "Montserrat Bold",fontSize: 20.sp,),),
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

                      ],
                    ),
                  ),
                ],

              )
          )

      ),

    );
  }
}
