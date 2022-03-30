import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class About_us extends StatefulWidget {
  const About_us({Key? key}) : super(key: key);

  @override
  State<About_us> createState() => _About_usState();
}

class _About_usState extends State<About_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text('About Us',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Image.asset('assets/Image/icons/menu2.png')),),
    body: SingleChildScrollView(physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/Image/img.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 1.h,color: Colors.black26),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 8,top: 8),
                child: Text("Lorem ipsum",style: TextStyle(fontFamily: "Montserrat Bold",fontSize: 20.sp,),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8,top: 8,bottom: 15),
                child: Container(color: Colors.blue,height: 3,width: MediaQuery.of(context).size.width * 0.20,),
              ),
              Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit,'
                  'sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliq'
                  'uam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation'
                  ' ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. '
                  'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie'
                  ' consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan '
                  'et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te'
                  ' feugait nulla facilisi. Lorem ipsum dolor sit amet, cons ectetuer adipiscing elit, sed diam nonummy'
                  ' nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,'
                  ' quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. '
              ,style: TextStyle(fontFamily: "Montserrat Medium",fontSize: 12.sp,color: Color(0xff6B779A),),),
              Padding(
                padding: const EdgeInsets.only(right: 8,top: 8),
                child: Text("Lorem ipsum",style: TextStyle(fontFamily: "Montserrat Bold",fontSize: 20.sp,),),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8,top: 8,bottom: 15),
                child: Container(color: Colors.blue,height: 3,width: MediaQuery.of(context).size.width * 0.20,),
              ),
              Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit,'
                  'sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliq'
                  'uam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation'
                  ' ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. '
                  'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie'
                  ' consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan '
                  'et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te'
                  ' feugait nulla facilisi. Lorem ipsum dolor sit amet, cons ectetuer adipiscing elit, sed diam nonummy'
                  ' nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,'
                  ' quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. '
                ,style: TextStyle(fontFamily: "Montserrat Medium",fontSize: 12.sp,color: Color(0xff6B779A),),),

            ],
        ),
      ),
    ),);
  }
}
