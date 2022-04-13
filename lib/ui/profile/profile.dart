//import 'dart:html';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:doctor_1/ui/profile/Edit_num.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'Edit_numotp.dart';
import 'Edit_profile.dart';
//import 'package:image_picker/image_picker.dart';
import 'EmailAdd.dart';
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  bool _load = false;
  File? imageFile;
  final picker = ImagePicker();
  PickedFile? pickedImage;
  _getFromGallery(BuildContext context) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    _cropImage(pickedFile?.path);
    // if (pickedFile != null) {
    //   setState(() {
    //     imageFile = File(pickedFile.path);
    //     _load = false;
    //     Navigator.of(context).pop();
    //   });
    //   _cropImage(pickedFile.path);
    // }
  }
  _cropImage(filePath) async {
    File? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    if (croppedImage != null) {
      imageFile = croppedImage;
      setState(() {
        _load = false;
        Navigator.of(context).pop();
      });
    }
  }
  /// Get from Camera
  _getFromCamera(BuildContext context) async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        _load = false;
        Navigator.of(context).pop();
      });
    }
  }
  Future<void>_showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder:( BuildContext context) {
      return AlertDialog(
        title: Text('enter your choice'),
        content: SingleChildScrollView(
          child: ListBody(
            children:<Widget> [
              GestureDetector(
                child: Text('Gallary'),
                onTap: (){
                  _getFromGallery(context);
                  //_openGallary(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text('Camera'),
                onTap: (){
                  //  _openCamera(context);
                  _getFromCamera(context);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
 // late File imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      // AppBar(centerTitle: true,title: ( const Text("Verification",style: TextStyle(color: Colors.black))),
      //   backgroundColor: (Colors.transparent),
      //   elevation: 0.0,
      //   leading: IconButton(onPressed: () { Navigator.pop(context); }, icon:const Icon( Icons.arrow_back,color: Colors.black,)),),
      body: SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 8,right: 16,left: 16),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child:
                        imageFile==null?
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset('assets/Image/doc/profile.png')
                          ),
                        ): Container(
                            margin: EdgeInsets.all(5),
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),child:
                            Image.file(imageFile!,height: 100,width: 100,fit: BoxFit.fill,),)),
                        // Container(
                        //
                        //   margin: EdgeInsets.all(5),
                        //   width: 100.w,
                        //   height: 100.h,
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(16),
                        //     child: Image.asset('assets/Image/doc/profile.png'),
                        //   ),
                        // ),
                      ),
                      Positioned(
                        bottom:0.0,
                        right: 0.0,
                        child: new IconButton(
                            icon: Image.asset('assets/Image/icons/Ax.png',),
                            onPressed: () {
                              _showChoiceDialog(context);
                             // Navigator.pop(context);
                            },splashColor: Colors.transparent,highlightColor: Colors.transparent),
                      ),
                    ],
                  ),
                ],
              ),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   "Personal Detail",
                   textAlign: TextAlign.right,
                   style: TextStyle(fontSize: 18,fontFamily: 'Montserrat SemiBold', color: Colors.black),
                 ),
                 TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Edit_profile()));}, child: Text('Edit'
                 , style: TextStyle(fontSize: 18,fontFamily: 'Montserrat Medium', color: Colors.blue),))
               ],
             ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(16.r) // use instead of BorderRadius.all(Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Full Name",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 15.sp,fontFamily: 'Montserrat SemiBold', color: Colors.black26),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 2)),
                              Text(
                                "jhon doe",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 18.sp,fontFamily: 'Montserrat SemiBold', color: Colors.black),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 10.sp)),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Age",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontSize: 15.sp,fontFamily: 'Montserrat SemiBold', color: Colors.black26),
                                      ),
                                      Padding(padding: EdgeInsets.only(bottom: 2)),
                                      Text(
                                        "26",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontSize: 18.sp,fontFamily: 'Montserrat SemiBold', color: Colors.black),
                                      ),]),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 50),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Gender",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 15.sp,fontFamily: 'Montserrat SemiBold', color: Colors.black26),
                                          ),
                                          Padding(padding: EdgeInsets.only(bottom: 2)),
                                          Text(
                                            "Male",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(fontSize: 18.sp,fontFamily: 'Montserrat SemiBold', color: Colors.black),
                                          ),]),
                                  )

                                ],
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mobile & Email",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 18,fontFamily: 'Montserrat SemiBold', color: Colors.black),
                    ),

                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(16.r) // use instead of BorderRadius.all(Radius.circular(20))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Mobile Number",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 15.sp,fontFamily: 'Montserrat SemiBold', color: Colors.black26),
                                        ),
                                        Padding(padding: EdgeInsets.only(bottom: 2)),
                                        Text(
                                          "+91 9898989898",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 18.sp,fontFamily: 'Montserrat SemiBold', color: Colors.black),
                                        ),]),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        TextButton(onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Edit_num()));
                                        },
                                          child:
                                         Text( "Edit",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(fontSize: 18.sp,fontFamily: 'Montserrat Medium', color: Colors.blue)),
                                        ),
                                      ])

                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 10.sp)),
                              Text(
                                "Email Address",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 15.sp,fontFamily: 'Montserrat SemiBold', color: Colors.black26),
                              ),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailAdd()));
                              },
                                child:
                                Text( "Edit Email",
                                    style: TextStyle(fontSize: 15.sp,fontFamily: 'Montserrat Medium',
                                        color: Colors.blue, decoration: TextDecoration.underline)),
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
