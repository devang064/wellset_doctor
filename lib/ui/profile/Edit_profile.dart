import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Edit_profile extends StatefulWidget {
  const Edit_profile({Key? key}) : super(key: key);

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  int selected = 0;
  Widget customRadio(String image,String text, int index) {
    return OutlineButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top:15,bottom: 15),
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
        title: (Text("Edit Profile", style: TextStyle(color: Colors.black))),
        backgroundColor: (Colors.transparent),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      bottomNavigationBar:
      Container(color: Colors.transparent,
        height: 50,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(right: 8,left: 8),
          child: FlatButton(onPressed: (){
            Navigator.pop(context);
          },
            child: Text('Save',
                style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
            color: Color(0xff2492EC),height: 40,shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),),
          ),),),
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


                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
