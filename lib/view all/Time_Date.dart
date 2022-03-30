
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:doctor_1/Appointment%20Detail/lab_Appointmentdetail.dart';
import 'package:doctor_1/view%20all/map.dart';
import 'package:doctor_1/view%20all/maplab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
class DateandTime extends StatefulWidget {
  const DateandTime({Key? key}) : super(key: key);

  @override
  _DateandTimeState createState() => _DateandTimeState();
}

class _DateandTimeState extends State<DateandTime> {
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
 // DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text('Time & Date',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
        bottomNavigationBar:
        //     BottomAppBar(
        //         elevation: 0,
        //         color: Colors.transparent,
        //         child:Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: FlatButton(onPressed: (){},
        //             child: Text('Next',
        //                 style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
        //             color: Color(0xff2492EC),height: 50,shape:RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(15.r),),
        //           ),
        //         ) ,
        //     ),
        Container(color: Colors.transparent,
          height: 50,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.only(right: 8,left: 8),
            child: FlatButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>Lab_appointdetails()));},
              child: Text('Next',
                  style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
              color: Color(0xff2492EC),height: 40,shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),),
            ),
          ),),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                     //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Select Day',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 24.sp)),
            SizedBox(height: 10.h,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('December 2020',style: TextStyle(fontFamily: 'Montserrat Medium',color: Colors.black,fontSize: 19.sp),),
                Image.asset('assets/Image/bottomnavigation/mybus.png',color: Color(0xFF2492EC),height: 19.h,)
              ],

            ),
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                DatePicker(
                  DateTime.now(),
                  width: 55.w,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Color(0xFF2492EC),
                  dayTextStyle: TextStyle(fontSize: 13.sp,fontFamily: 'Montserrat Medium'),
                  monthTextStyle: TextStyle(fontSize: 0),
                  dateTextStyle: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp),
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Text('Select Time',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 24.sp)),
            SizedBox(height: 10.h,),
            CustomRadioButton(enableButtonWrap: true,
                elevation: 0,
                absoluteZeroSpacing: false,
                shapeRadius: 10.r,
                radius: 10.r,
                padding: 2,
                enableShape: true,
                unSelectedColor: Theme.of(context).canvasColor,
                buttonLables: [
                  '10 : 00 AM',
                  '10 : 15 AM',
                  '10 : 30 AM',
                  "12 : 30 AM",
                  "12 : 35 AM",
                ],
                buttonValues: [
                  "10 : 00 AM",
                  "10 : 15 AM",
                  "10 : 30 AM",
                  "12 : 30 AM",
                  "12 : 35 AM",
                ],
                width: 100.w,

                // customShape: RoundedRectangleBorder(
                   //borderRadius: BorderRadius.all(8),
                unSelectedBorderColor: Color(0xffc2c2c2),
                buttonTextStyle: ButtonTextStyle(

                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(fontSize: 12.sp,fontFamily: 'Montserrat Medium'),),
                radioButtonValue: (value) {
                  print(value);
                },
                selectedColor: Theme.of(context).accentColor,
              ),
            SizedBox(height: 10,),
            Text('Select Preference',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 24.sp)),

    Row(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RadioListTile(value: 1, groupValue:selectedRadioTile,
            onChanged: (val){
            setSelectedRadioTile(1);
            },
          title: Text('At lab',style: TextStyle(fontFamily: 'Montserrat Medium',color: Colors.black),),selected: true,dense: false,
          ),
        ),

         Expanded(child:    RadioListTile(value: 2, groupValue:selectedRadioTile,
           onChanged: (val){
             setSelectedRadioTile(2);
    },
              title: Text('At Home',style: TextStyle(fontFamily: 'Montserrat Medium',color: Colors.black),),
           selected: false,
           dense: false,
            ),
         ),
              ],
    ),
            Visibility(visible: (selectedRadioTile==2),
              child: Container(//height: 120.h,
                decoration: BoxDecoration(
                    border: Border.all(
                        color:Color(0xffA8A8A8),width: 0.5.w
                    ),

                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(children: [
                  Row(
                    children: [
                      Radio(value: 1, groupValue: selectedButton, onChanged: (val){
                        setSelectedRadio(1);
                      },
                      ),
                      Expanded(child: Text('Shilpgram Complex, Sant Kanvar Ram Chowk, Kalanala, Bhavnagar, Gujarat',
                        style: TextStyle(fontFamily: 'Montserrat Medium'),)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Divider(
                      color: Color(0xffA8A8A8),
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>lablocationexe()));
                  }, child:Text('+Add New Address',
                    style: TextStyle(fontFamily: "Montserrat Medium",
                        color: Color(0xffA8A8A8)),) ),
                ],
                ),
              ),
            ),
          ],
      ),
    )
    );
  }
}
