import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Contact_us extends StatefulWidget {
  const Contact_us({Key? key}) : super(key: key);

  @override
  State<Contact_us> createState() => _Contact_usState();
}

class _Contact_usState extends State<Contact_us> {
  @override
  Widget build(BuildContext context) {
    var _Textcontroller;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text('Contact Us',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon:  Image.asset('assets/Image/icons/menu2.png'),),),
      bottomNavigationBar: Container(
        height: 50,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(right: 8,left: 8),
          child: FlatButton(onPressed: (){Navigator.pop(context);},
            child: Text('Submit',
                style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
            color: Color(0xff2492EC),height: 40,shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),),
          ),
        ),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              "Full Name",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18,fontFamily: 'Montserrat Medium', color: Colors.black26),
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

            SizedBox(
              height: 15,
            ),
            Text(
              "Phone Number",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18,fontFamily: 'Montserrat Medium', color: Colors.black26),
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
              "Email Address",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18,fontFamily: 'Montserrat Medium',color: Colors.black26),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter Email Address",
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),),
         // (_Textcontroller.value.text.isEmpty) ? Text("Please Enter Message") :Text('Sent Message: ${_Textcontroller.value.text}'),
              SizedBox(height: 10,),
              Text(
                "Message",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18, fontFamily: 'Montserrat Medium',color: Colors.black26),
              ),
          TextFormField(
            controller: _Textcontroller,
            minLines: 2,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: 'Enter A Message Here',
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )
            ),
          ),

          ],),
        ),
      ),
    );
  }
}
