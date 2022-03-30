import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class lab_test extends StatefulWidget {
  const lab_test({Key? key}) : super(key: key);

  @override
  _lab_testState createState() => _lab_testState();
}
class instruction {
  instruction({required this.Text});

  final String Text;
}
List<instruction> choices = <instruction>[
  instruction(Text:'Avoiding specific foods and drinks such as cooked meats, herbal tea, or alcohol.' ),
  instruction(Text: 'Making sure not to overeat the day before a test'),
  instruction(Text: 'Not smoking'),
  instruction(Text: 'Avoiding specific behaviors such as strenuous exercise or sexual activity'),
  instruction(Text: 'Avoiding certain medicines and/or supplements. Be sure to talk to your provider'
      ' about what you are currently taking, including over-the-counter medicines, vitamins, and supplements.')
];
class _lab_testState extends State<lab_test> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
          centerTitle: true,
          title: Text('Featured doctor',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
          leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
        ),
      bottomNavigationBar: Container(
        height: 50,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.only(right: 8,left: 8),
          child: FlatButton(onPressed: (){Navigator.pop(context);},child: Text('Remove',style: TextStyle(fontFamily: 'Montserrat SemiBold',fontSize: 17.sp,color: Colors.red)),
            height: 40,splashColor:Colors.transparent,  highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,shape: RoundedRectangleBorder(side: BorderSide(
          color: Colors.red,
          width: 1,
          style: BorderStyle.solid
      ), borderRadius: BorderRadius.circular(8)),
          ),
        ),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,margin: EdgeInsets.all(15),decoration: BoxDecoration(
              border: Border.all(color: Colors.black38,
                  width: 0.1
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(20.0)
              ),
            ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('D-Dimer Test',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 17.sp),),
                             Column(
                               children: [
                                 Text("Lorem ipsum is simply dummy text of the printing and type setting  industry",style: TextStyle(fontFamily:'Montserrat Medium',color: Color(0xff6B779A) ,fontSize: 12.sp),),
                               ],
                             ),
                    Text("₹980",style: TextStyle(fontFamily:'Montserrat SemiBold',color: Color(0xff6B779A) ,fontSize: 15.sp),),
                  ],
                ),
              ),
            ),
            Text('Test Instructions:',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 17.sp),),
    ListView.builder( shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
    itemCount: choices.length,
    itemBuilder: (BuildContext ctx, i) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height: 20.h,),
        Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [Icon(Icons.circle,size: 10.sp,color: Color(0xff6B779A)),SizedBox(width: 5,),
            Expanded(child: Text(choices[i].Text,style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Color(0xff6B779A),fontSize: 12.sp),)),
          ],
        ),

      ],
    );
    }
    ),
    ],
        ),
      ),
    );
  }
}

