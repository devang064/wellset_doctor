import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  ScrollController _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text("Review and Ratings",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
      body: ListView(physics:BouncingScrollPhysics(),
          controller: _controller,
          children: <Widget>[Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
        Container(height: 160.h,
        decoration: BoxDecoration(
        border: Border.all(width: 0.7.w,
        color: Colors.black12,
        ),
          borderRadius: BorderRadius.all(Radius.circular(20.r))
    ),
          child:     Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("4.5",style: TextStyle(fontFamily: 'Montserrat Bold',color: Color(0xff21222D),fontSize: 30),),
                   SizedBox(height: 5,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,color: Color(0xff2492EC),size:15),
                        Icon(Icons.star,color: Color(0xff2492EC),size:15),
                        Icon(Icons.star,color: Color(0xff2492EC),size:15),
                        Icon(Icons.star,color: Color(0xff2492EC),size:15),
                        Icon(Icons.star,color: Color(0xffcfe9ff),size: 15,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("52839",style: TextStyle(fontFamily: 'Montserrat Raguler',)),
                  ],
                ),
              ),
              Container(height: 130.h, child: VerticalDivider(color: Colors.black12)),
          Expanded(flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


    ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: r1.length,
    itemBuilder: (BuildContext ctx, i) {
      return
        Container(
          padding: EdgeInsets.all(5.0),
          child: Row(mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(flex: 1,
                  child: Text(r1[i].text1,
                      style: TextStyle(fontFamily: 'Montserrat Medium',))),
              Expanded(flex: 8,
                child: LinearPercentIndicator(
                  // width: 100,
                  animation: true,
                  lineHeight: 4.0,
                  animationDuration: 2500,
                  percent: r1[i].per,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Color(0xff2492EC),
                  backgroundColor: Color(0xffcfe9ff),
                ),
              ),
              Expanded(flex: 2,
                  child: Text(r1[i].text2,
                    style: TextStyle(fontFamily: 'Montserrat Medium',),)),
            ],
          ),
        );
    })
                  ],

                ),
            ),
          )
            ],
          ),
          ),
        ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: r2.length,
    itemBuilder: (BuildContext ctx, j) {
      return
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Container(height: 160.h,
            decoration: BoxDecoration(
                border: Border.all(width: 0.7.w,
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.r))
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                SizedBox(height: 5,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Container(

                          margin: EdgeInsets.all(5),
                          width: 70.w,
                          height: 70.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(r2[j].image),
                          ),
                        ),
                        Text(r2[j].name,
                          style: TextStyle(fontFamily: 'Montserrat Medium'),),

                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5,)),
                    Expanded(child: Text(
                      r2[j].review, style: TextStyle(
                        fontFamily: 'Montserrat Medium',
                        color: Color(0xff6B779A)),)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0,left: 8),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(r2[j].rating, style: TextStyle(
                              fontFamily: 'Montserrat Medium',
                              color: Color(0xff6B779A),
                              fontSize: 13)),
                          Icon(Icons.star, color: Colors.amberAccent, size: 13,),
                          Icon(Icons.star, color: Colors.amberAccent, size: 13,),
                          Icon(Icons.star, color: Colors.amberAccent, size: 13,),
                          Icon(Icons.star, color: Colors.amberAccent, size: 13,),
                          Icon(Icons.star, color: Colors.amberAccent, size: 13,),
                        ],
                      ),
                      Text(r2[j].date, style: TextStyle(
                          fontFamily: 'Montserrat Medium', fontSize: 15))
                    ],
                  ),
                )
              ],
            ),

          ),
        );

    })

          // Image.asset('assets/Image/doc/profile.png'),
          // Image.asset('assets/Image/doc/profile.png'),

        ],),
      ),])
    );
  }
}
class reviewlist {
  reviewlist(
      {required this.text1,
        required this.per,
        required this.text2,
      });

  String text1;
  double per;
  String text2;
}

List<reviewlist> r1 = <reviewlist>[
reviewlist(text1: '5', per: 0.54, text2: '54%'),
  reviewlist(text1: '4', per: 0.92, text2: '92%'),
  reviewlist(text1: '3', per: 0.69, text2: '69%'),
  reviewlist(text1: '2', per: 0.10, text2: '10%'),
  reviewlist(text1: '1', per: 0.20, text2: '20%'),
];

class userlist {
  userlist(
      {required this.image,
        required this.name,
        required this.review,
        required this.rating,
        required this.date
      });

  String image;
  String name ;
  String review;
  String rating;
  String date;
}

List<userlist> r2 = <userlist>[
 userlist(image: 'assets/Image/doc/profile.png', name: 'Petey Cruiser', review:"Lorem Ipsum is simply dummy text of the printing and "
     "typesetting industry. Lorem Ipsum has been the industry's "
     "standard dummy text ever", rating: '(4.5)', date: '12Th April 2020'),
  userlist(image: 'assets/Image/doc/profile.png', name: 'Petey Cruiser', review: "Lorem Ipsum is simply dummy text of the printing and "
      "typesetting industry. Lorem Ipsum has been the industry's ", rating: '(4.5)', date: '12Th April 2020'),
  userlist(image: 'assets/Image/doc/profile.png', name: 'Petey Cruiser', review: "Lorem Ipsum is simply dummy text of the printing and "
      "typesetting industry. Lorem Ipsum has been the industry's ", rating: '(4.5)', date: '12Th April 2020'),
  userlist(image: 'assets/Image/doc/profile.png', name: 'Petey Cruiser', review: "Lorem Ipsum is simply dummy text of the printing and "
      "typesetting industry. Lorem Ipsum has been the industry's ", rating: '(4.5)', date: '12Th April 2020'),

];