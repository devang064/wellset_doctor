import 'package:doctor_1/ui/view%20all/Time_Date.dart';
import 'package:doctor_1/ui/view%20all/labinfo.dart';
import 'package:doctor_1/ui/view%20all/labtest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Lab_Details extends StatefulWidget {
  const Lab_Details({Key? key}) : super(key: key);

  @override
  _Lab_DetailsState createState() => _Lab_DetailsState();
}

class list {
  list({ required this.Test,required this.Text,required this.Price,required this.add});

  final String Test;
  final String Text;
  final String Price;
   bool add =false;
}
 List<list> choices = <list>[

 list(Test: 'D-Dimer Test', Text: 'Lorem Ipsum is simply', Price: '₹980',add: false),
  list(Test: 'Covid-19 Test', Text: 'Lorem Ipsum is simply', Price: '₹800',add: false),
  list(Test: 'Allergy Skin Test', Text: 'Lorem Ipsum is simply', Price: '₹760',add: false),
  list(Test: 'Alt-Blood Test', Text: 'Lorem Ipsum is simply', Price: '₹980',add: false),
  list(Test: 'Blood differential', Text: 'Lorem Ipsum is simply', Price: '₹980',add: false),
  list(Test: 'D-Dimer Test', Text: 'Lorem Ipsum is simply', Price: '₹980',add: false),
  list(Test: 'Covid-19 Test', Text: 'Lorem Ipsum is simply', Price: '₹800',add: false),
  list(Test: 'Allergy Skin Test', Text: 'Lorem Ipsum is simply', Price: '₹760',add: false),
  list(Test: 'Alt-Blood Test', Text: 'Lorem Ipsum is simply', Price: '₹980',add: false),
  list(Test: 'Blood differential', Text: 'Lorem Ipsum is simply', Price: '₹980',add: false),


];
class _Lab_DetailsState extends State<Lab_Details> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(right: 8,left: 8),
          child: FlatButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DateandTime()));},
            child: Text('Next',
                style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.white)),
            color: Color(0xff2492EC),height: 40,shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),),
          ),
        ),),


      body: CustomScrollView(physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Lab Details',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
            centerTitle: true,
            leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
            pinned: true,
            actions: <Widget>[
              Builder(
                builder: (context){
                  return Column(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/Image/icons/about.png',filterQuality: FilterQuality.high,),
                        onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Lab_info()));
                        },
                      ),
                    ],
                  );
                },
              )
            ],
            expandedHeight:  MediaQuery.of(context).size.height / 2,
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25.r),
              ),
            ),
            backgroundColor: Color(0xFFf0f4f7),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 80,),
                  //  SizedBox(height: 100.h,),
                  Container(height: 150.h,width: 150.w,child: Image.asset('assets/Image/lab/lab1.png',fit: BoxFit.fill,),
                  ),
                  Column(
                    children: [
                      Text("LabCity",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 17.sp),),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.location_on,color: Color(0xff6B779A)),
                          Text("Bhavnagar,Gujrat ",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A)),),
                        ],
                      ),
                    ],
                  ),


                ],),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                <Widget>[
                      ListView.builder( shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                          itemCount: choices.length,
                          itemBuilder: (BuildContext ctx, i) {
                            return   Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                              InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>lab_test()));},
                            borderRadius: BorderRadius.all(
                                Radius.circular(20.0)),
                                child: Container(height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38,
                                        width: 0.1
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        (
                                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [Text(choices[i].Test,style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 17.sp),),
                                                Text(choices[i].Text,style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A),fontSize: 14.sp),),
                                                Text(choices[i].Price,style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A),fontSize: 15.sp),),

                                              ],
                                            )
                                        ),


                                        choices[i].add?FlatButton(onPressed: (){setState(() {
                                          choices[i].add=!choices[i].add;
                                        });}, child: Text('Add',style: TextStyle(color: Colors.white,fontFamily: 'Montserrat SemiBold'),),color: Colors.blue,shape:RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.r),
                                          ),
                                        ) ,):
                                        FlatButton(onPressed: (){setState(() {
                                          choices[i].add=!choices[i].add;
                                        });}, child: Text('Remove', style: TextStyle(
                                            color: Colors.red,fontFamily: 'Montserrat SemiBold'
                                        )
                                        ),

                                          shape: RoundedRectangleBorder(side: BorderSide(
                                              color: Colors.red,
                                              width: 1,
                                              style: BorderStyle.solid
                                          ), borderRadius: BorderRadius.circular(8)),),
                                        // FlatButton(
                                        //   onPressed: null,
                                        //   child: Text('Remove', style: TextStyle(
                                        //       color: Colors.blue
                                        //   )
                                        //   ),
                                        //   textColor: MyColor.white,
                                        //   shape: RoundedRectangleBorder(side: BorderSide(
                                        //       color: Colors.blue,
                                        //       width: 1,
                                        //       style: BorderStyle.solid
                                        //   ), borderRadius: BorderRadius.circular(50)),
                                        // )
                                      ],
                                    ),
                            ),
                            ),
                              ),
                            );}),

                                 ]


            ),),

        ],
      ),
    );
  }
}

