import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view all/Time_Date.dart';
import '../view all/map.dart';
class Add_Address extends StatefulWidget {
  const Add_Address({Key? key}) : super(key: key);

  @override
  State<Add_Address> createState() => _Add_AddressState();
}

class _Add_AddressState extends State<Add_Address> {

  var _Textcontroller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text('Add Address',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
      bottomNavigationBar:

      Container(color: Colors.transparent,
        height: 50,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(right: 8,left: 8),
          child: FlatButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>DateandTime()));},
            child: Text('Save',
                style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
            color: Color(0xff2492EC),height: 40,shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),),
          ),
        ),),
      body:SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top:10,bottom: 8,right: 10,left: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Select Location', style: TextStyle(fontFamily: "Montserrat Medium",
                color: Color(0xffA8A8A8)),),
              ),
              InkWell(onTap: (){Navigator.pop(context,MaterialPageRoute(builder: (context)=>lablocationexe()));},
                child: Container(
                  width: 100,
                  height: 100,

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/Image/lab and doc/Map.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "House/Street",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18,fontFamily: 'Montserrat Medium', color: Colors.black26),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  //  labelText: "Full Name",
                  hintText: "3, Royal Villa",
                  hintStyle: TextStyle(fontFamily: 'Montserrat Medium', color: Colors.black),
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
                "Address",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18, fontFamily: 'Montserrat Medium',color: Colors.black26),
              ),
              TextFormField(
                controller: _Textcontroller,
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Shilpgram Complex, Sant Kanvar Ram Chowk, Kalanala, Bhavnagar, Gujarat',
                    hintStyle: TextStyle(fontFamily: 'Montserrat Medium', color: Colors.black),


                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                ),
              ),
              Text(
                "City",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18,fontFamily: 'Montserrat Medium', color: Colors.black26),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //  labelText: "Full Name",
                  hintText: "Riyadh",
                  hintStyle: TextStyle(fontFamily: 'Montserrat Medium', color: Colors.black),
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
                "Save As",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18,fontFamily: 'Montserrat Medium',color: Colors.black26),
              ),
              CustomRadioButton(enableButtonWrap: true,
                elevation: 0,
                absoluteZeroSpacing: false,
                shapeRadius: 15.r,
                radius: 15.r,
                padding: 2,
                enableShape: true,
                unSelectedColor: Theme.of(context).canvasColor,
                buttonLables: [
                  'Home',
                  'Office',
                  'Others',

                ],
                buttonValues: [
                  'Home',
                  'Office',
                  'Others',

                ],
                width: 100.w,
                height: 50.h,
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
            ],
          ),
        ),
      ),
    );
  }
}
