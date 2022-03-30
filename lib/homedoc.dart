import 'package:doctor_1/booking/Mybooking.dart';
import 'package:doctor_1/catagorytabview.dart';
import 'package:doctor_1/doctor.dart';
import 'package:doctor_1/lab.dart';
import 'package:doctor_1/menu_list/About_us.dart';
import 'package:doctor_1/menu_list/Faqs.dart';
import 'package:doctor_1/menu_list/contactus.dart';
import 'package:doctor_1/notification.dart';
import 'package:doctor_1/page1.dart';
import 'package:doctor_1/page3.dart';
import 'package:doctor_1/page4.dart';
import 'package:doctor_1/profile/profile.dart';
import 'package:doctor_1/search.dart';
import 'package:doctor_1/view%20all/category.dart';
import 'package:doctor_1/view%20all/doctorview.dart';
import 'package:doctor_1/view%20all/labdetails.dart';
import 'package:doctor_1/view%20all/labview.dart';
import 'package:doctor_1/view%20all/docdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Home1 extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home1> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
     backdropColor: Color(0xFF2492EC),
     controller: _advancedDrawerController,
     animationCurve: Curves.easeInOut,
     animationDuration: const Duration(milliseconds: 250),
     animateChildDecoration: true,

      
     rtlOpening: false,
     disabledGestures: false,
     childDecoration: const BoxDecoration(

       borderRadius: const BorderRadius.all(Radius.circular(20)),
     ),
     child: Scaffold(
       appBar: AppBar(toolbarHeight: 70,
         title: Column(
           children: [

             Container(
               width: 40,
               child: Image.asset('assets/Image/icons/plusblue.png',),
             ),
             SizedBox(height: 10),
             Visibility(
               child: Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.location_on,color: Colors.blue,size: 15,),
                     InkWell(onTap: (){},child: Text('Ahmedabad,india',style: TextStyle(color: Colors.black,fontFamily: "Montserrat SemiBold",fontSize: 16),)),
                   ],

               ),
             ),

           ],
         ),
         centerTitle: true,

         // Column(mainAxisAlignment: MainAxisAlignment.center,
         //    children: [
         //       Center(child: Icon(Icons.health_and_safety_sharp,size: 50,color: Color(0xFF2492EC),))
         //    ],
         //  ),
         backgroundColor: (Colors.transparent),
         elevation: 0.0,
         //centerTitle: true,
         leading: Column(
           children: [
             IconButton(
               onPressed: _handleMenuButtonPressed,
               icon: ValueListenableBuilder<AdvancedDrawerValue>(
                 valueListenable: _advancedDrawerController,
                 builder: (_, value, __) {
                   return AnimatedSwitcher(
                     duration: Duration(milliseconds: 250),
                     child: Image.asset(
                       value.visible?'assets/Image/icons/can.png':'assets/Image/icons/menu2.png',filterQuality: FilterQuality.none,
                     ),
                     // child: Icon(
                     //   value.visible ? Icons.clear : Icons.menu_outlined,color: Colors.black,
                     //   key: ValueKey<bool>(value.visible),
                     // ),
                   );
                 },
               ),
             ),
           ],
         ),
         actions: <Widget>[
           Builder(
             builder: (context){
               return Column(
                 children: [
                   IconButton(
                     icon: Image.asset('assets/Image/icons/notification1.png',filterQuality: FilterQuality.high,),
                     onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>notification()));
                     },
                   ),
                 ],
               );
             },
           )
         ],
       ),
       // endDrawer: Drawer(
       //   child: Container(
       //     color: Colors.red,
       //     child: Center(
       //       child: Text(
       //         "Profile",
       //         style: TextStyle(
       //             color: Colors.white,
       //             fontSize: 30
       //         ),
       //       ),
       //     ),
       //   ),
       // ),
       body: Bottomnavigation(),
     ),
     drawer: SafeArea(
       child: Container(
         child: ListTileTheme(
           textColor: Colors.white,
           iconColor: Colors.white,
           child: Column(
             mainAxisSize: MainAxisSize.max,
             children: [
               SizedBox(height:50 ,),
               Container(
                 margin:  EdgeInsets.only(
                   top:0.00,
                   bottom: 25.0,
                 ),
                 height: 100,
                 child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [


                     Padding(
                       padding: const EdgeInsets.only(left: 8),
                       child: ClipRRect(
                         borderRadius:
                         BorderRadius.circular(8.0),
                         child: InkWell(onTap: (){},
                             borderRadius: BorderRadius.circular(8.0),
                             child: Image.asset('assets/Image/doc/doc1.png',height: 100,),),
                       ),
                     ),
                     //    SizedBox(width: 16),

                     Column(crossAxisAlignment: CrossAxisAlignment.start,

                         children: [
                           SizedBox(height: 16,),
                           Text("Dr.robert",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Montserrat Bold"),),
                           SizedBox(height: 8,),
                           Text("+91 9898637845",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Montserrat SemiBold"),),
                         ]
                     ),
                   ],
                 ),
               ),
               // Container(
               //   width: 128.0,
               //   height: 128.0,
               //   margin: const EdgeInsets.only(
               //     top: 24.0,
               //     bottom: 64.0,
               //   ),
               //
               //  clipBehavior: Clip.antiAlias,
               //   decoration: BoxDecoration(
               //     color: Colors.black26,
               //     shape: BoxShape.circle,
               //   ),
               //   child: Image.asset(
               //     'asset/img.png',
               //   ),
               // ),
               ListTile(
                 onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Home1()));},
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                 leading: Icon(Icons.home),
                 title: Text('Home'),
               ),
               ListTile(
                 onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact_us()));},
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                 leading: Icon(Icons.headset_mic_outlined),
                 title: Text('Contact Us',style: TextStyle(fontFamily: "Montserrat Medium")),
               ),
               ListTile(
                 onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>About_us()));},

                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                 leading: Icon(Icons.announcement),
                 title: Text('About Us',style: TextStyle(fontFamily: "Montserrat Medium")),
               ),
               ListTile(
                   onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Faqs()));},
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                   leading: Icon(Icons.question_answer_outlined),
                   title: Text("FAQ's",style: TextStyle(fontFamily: "Montserrat Medium"))
               ),
               ListTile(
                   onTap: () {},
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                   leading: Icon(Icons.circle),
                   title: Text("Terms & Condition ",style: TextStyle(fontFamily: "Montserrat Medium"))
               ),
               ListTile(
                   onTap: () {},
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                   leading: Icon(Icons.star_rate),
                   title: Text("Rate Us",style: TextStyle(fontFamily: "Montserrat Medium"))
               ),
               Spacer(),
               Row(mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(bottom: 20,left: 20),
                     child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context)=>p3()));},
                         child: Text('Logout',style: TextStyle(fontFamily: "Montserrat Medium",color:Colors.white ,fontSize: 16),)),
                   ),
                 ],
               ),
               // DefaultTextStyle(
               //   style: TextStyle(
               //     fontSize: 12,
               //  //   color: Colors.white54,
               //   ),
               //  child:
               //   ),
             ],
           ),
         ),
       ),
     ),
      );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();

  }
}
class Bottomnavigation extends StatefulWidget {
  Bottomnavigation({Key? key}) : super(key: key);

  @override
  State<Bottomnavigation> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Bottomnavigation> {
  int _selectedIndex = 0;
  //static TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _pages = <Widget>[
    home_1(),
    My_bookings(),
    profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //   height: MediaQuery.of(context).size.height,
        // padding: EdgeInsets.all(28),
        child: _pages.elementAt(_selectedIndex),

      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar:SafeArea(
        child: Container(//height: 100,//height: MediaQuery.of(context).size.height,
          decoration:BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),topRight:Radius.circular(8) ,
            ),boxShadow: [BoxShadow(
            color: Colors.black54,blurRadius: 10,spreadRadius: 0,
          )],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(topRight:Radius.circular(30) ,topLeft: Radius.circular(30),
            ),
            //child: BottomNavigationBar(backgroundColor: Colors.white,),
            child: BottomNavigationBar(backgroundColor: Colors.white,

              type: BottomNavigationBarType.fixed,
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon:
                  Image.asset('assets/Image/bottomnavigation/hm.png',height: 20,color:(_selectedIndex == 0)?Color(0xFF2492EC):Colors.black12,),

                 label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/Image/bottomnavigation/mybus.png',height: 20,color:(_selectedIndex == 1)?Color(0xFF2492EC):Colors.black12,),
                  //Icon(Icons.calendar_today_rounded),
                  label: 'My Bookings',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/Image/bottomnavigation/profie.png',height: 20,color:(_selectedIndex == 2)?Color(0xFF2492EC):Colors.black12,),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,

            selectedItemColor: Color(0xFF2492EC),
             // selectedItemColor: Color(0xFF2492EC),
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Color(0xFF2492EC),
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
class home_1 extends StatefulWidget {
  const home_1({Key? key}) : super(key: key);

  @override
  _home_1State createState() => _home_1State();
}

class _home_1State extends State<home_1> {
  final  controller = ScrollController();
  int index=0;
  void scrollDown() {
    final double end =controller.position.maxScrollExtent;
    controller.animateTo(end,duration: Duration(seconds: 1),curve: Curves.easeIn);
  }

  Widget container( String Img, String text,dynamic color)
  {
    return     Container(
      width: 122.h,
      child: Card(
        child:InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>tabcat()));},borderRadius: BorderRadius.circular(8),
        child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(Img,height: 25,),
            Text(text,style: TextStyle(fontFamily: "Montserrat Medium",fontSize:13.sp ),),
          ],
        ) ,),
        //   semanticContainer: true,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }
  //https://cdn3.iconfinder.com/data/icons/male-user-icons/500/muser-dr1-512.png"Dr.robert""Dentist""4.5(130 reviews)"
  Widget container2(String imgdoc,String i1,String i2,String i3,){
    return

      Container(
        width: 160,
        child: Card(
          child: InkWell(onTap: (){},borderRadius: BorderRadius.circular(0),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(imgdoc,height: 100,),
                Text(i1,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat SemiBold"),),
                Text(i2,style: TextStyle(fontFamily: "Montserrat Medium"),),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                    Text(i3,style: TextStyle(fontFamily: "Montserrat Medium",color: Colors.black54,fontSize: 12),),
                  ],)

              ],),
          ),
          //   semanticContainer: true,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // elevation: 5,
          margin: EdgeInsets.all(10),
        ),
      );}

  Widget container3(String imglab,String i1,String i2,String i3,){
    return

      Container(
        width: 160,
        child: Card(child:InkWell(onTap: (){},borderRadius: BorderRadius.circular(8),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(imglab,height: 100,),
              Text(i1,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat SemiBold"),),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,size: 13,),
                  Text(i2,style: TextStyle(fontFamily:"Montserrat Medium" ),),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                  Text(i3,style: TextStyle(fontFamily: "Montserrat Medium",fontSize:12,color: Colors.black54 ),),
                ],)

            ],),),
          //   semanticContainer: true,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // elevation: 5,
          margin: EdgeInsets.all(10),
        ),
      );}
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children:<Widget> [
          InkWell(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>search()));

          } ,
             child:Row(children:[
             Expanded(
               child: Container(height: 60.h,
                   decoration: BoxDecoration(
                       border: Border.all(width: 0.7.w,
                         color: Colors.black12,
                       ),
                       
                       borderRadius: BorderRadius.all(Radius.circular(20.r))
                   ),
                   child:Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: Row(
                       children: [
                          Icon(Icons.search,color: Colors.blue,),SizedBox(width: 10,),
                         Text('Enter a search term...',style: TextStyle( color:     Colors.black54,fontFamily: 'Montserrat Medium'),),
                       ],

                     ),
                   )),
             ),
             ])
             //TextField(cursorHeight: 10,
            //   decoration: InputDecoration(prefixIcon: Icon(Icons.search),isDense: true,                      // Added this
            //       contentPadding: EdgeInsets.only(top:2,bottom: 2),
            //       border: OutlineInputBorder(borderRadius:  BorderRadius.all(Radius.circular(15)),),
            //       hintText: 'Enter a search term'
            //   ),
            // ),
          ),
          Container(
            child: Expanded(
              child: ListView(physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Well Set",style: TextStyle(fontSize: 20,fontFamily: "Montserrat SemiBold"),),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
                  Container(
                    height: 150,
                    child: Row(
                      children: [Expanded(child:Material(child: Container( decoration: BoxDecoration(color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20),
                        ),
                      ),
                        child:InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>doctor()));},borderRadius: BorderRadius.circular(20),
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('assets/Image/Group 93056.png',cacheHeight: 100
                                //filterQuality: FilterQuality.high,cacheHeight: 100,
                                ),
                              Text("Doctor",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "Montserrat Medium"),)
                            ],
                          ),
                        ),
                      )),),
                        Padding(padding: EdgeInsets.only(right: 10,left: 10)),
                        Expanded(child: Container(decoration: BoxDecoration(color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(20),),
                        ),

                          child:InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Lab()));},borderRadius: BorderRadius.circular(20),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/Image/icons/lab1.png',filterQuality: FilterQuality.high,cacheHeight: 100,),
                                Text("Lab",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "Montserrat Medium"),)
                              ],
                            ),
                          ),)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Category",style: TextStyle(fontSize: 16,fontFamily: "Montserrat SemiBold"),),
                        TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>category()));},child: Row(
                          children: [
                            Text("View All",style: TextStyle(fontSize: 16,fontFamily: "Montserrat Medium"),),
                            Icon(Icons.arrow_forward),
                          ],
                        ),),
                      ],
                    ),
                  ),

                  Container(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        container("assets/Image/icons/teeth.png", "dentist",Color(0xFFe3effa)),
                        container("assets/Image/icons/redh.png", "Cardiologist",Color(0xFFfadcd4)),
                        container("assets/Image/icons/brain.png", "psychologist",Color(0xFFfae7ca)),
                        container("assets/Image/icons/eye.png", "opthalmologist",Color(0xFFedfff6)),
                        container("assets/Image/icons/lungs.png", "pulmologist",Color(0xFFddffd6)),
                      ],
                    ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Featured Doctor",style: TextStyle(fontSize: 20,fontWeight: FontWeight. bold,fontFamily: "Montserrat SemiBold"),),
                        TextButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>doclist()));},child: Row(
                          children: [
                            Text("View All",style: TextStyle(fontSize: 16,fontFamily: "Montserrat Medium"),),
                            Icon(Icons.arrow_forward),
                          ],
                        ),),
                      ],
                    ),
                  ),
                  // Container(
                  //
                  //     child:  Container(
                  //       height: 200,
                  //       child: ListView(
                  //           scrollDirection: Axis.horizontal,
                  //           children: <Widget>[
                  //             container2( "assets/Image/doc/doc1.png","Dr.robert","Dentist","4.5(130 reviews)",),
                  //             container2( "assets/Image/doc/doc2.png","Dr.robert","Dentist","4.5(130 reviews)",),
                  //             container2( "assets/Image/doc/doc3.png","Dr.robert","Dentist","4.5(130 reviews)",),
                  //             container2( "assets/Image/doc/doc4.png","Dr.robert","Dentist","4.5(130 reviews)",),
                  //             container2( "assets/Image/doc/doc5.png","Dr.robert","Dentist","4.5(130 reviews)",),
                  //           ]),)),
                  Container(height: 210,
                    child: ListView.builder( physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: choices.length,
                       scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctx, i) {
                          return
                            Container(height: 200,width: 160,
                              child: Card(
                                child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Doctor_Details()));},borderRadius: BorderRadius.circular(0),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(choices[i].image,height: 100.h,),
                                      Text(choices[i].name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat SemiBold"),),
                                      Text(choices[i].Catagory,style: TextStyle(fontFamily: "Montserrat Medium"),),
                                      Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.star_rate_rounded,size: 15.sp,color: Colors.amberAccent,),
                                          Text(choices[i].reviws,style: TextStyle(fontFamily: "Montserrat Medium",color: Colors.black54,fontSize: 12.sp),),
                                        ],)

                                    ],),
                                ),
                                //   semanticContainer: true,
                                // clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                // elevation: 5,
                                margin: EdgeInsets.all(10),
                              ),
                            );

                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Featured Lab",style: TextStyle(fontSize: 16,fontFamily: "Montserrat SemiBold"),),
                        TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>labview()));},child: Row(
                          children: [
                            Text("View All",style: TextStyle(fontSize: 16,fontFamily: "Montserrat Medium"),),
                            Icon(Icons.arrow_forward),
                          ],
                        ),),
                      ],
                    ),
                  ),
                  Container(height: 210,
                    child: ListView.builder( physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: lab.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctx, i) {
                          return
                            Container(height: 200,width: 160,
                              child: Card(
                                child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Lab_Details()));},borderRadius: BorderRadius.circular(0),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(lab[i].image,height: 100.h,),
                                      Text(lab[i].name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat SemiBold",fontSize: 15.sp),),
                                      Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.location_on,size: 13.h,),
                                          Text(lab[i].Location,style: TextStyle(fontFamily: "Montserrat Medium",fontSize:15.sp ),),
                                        ],
                                      ),
                                      Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                                          Text(lab[i].reviws,style: TextStyle(fontFamily: "Montserrat Medium",color: Colors.black54,fontSize: 12.sp),),
                                        ],)

                                    ],),
                                ),
                                //   semanticContainer: true,
                                // clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                // elevation: 5,
                                margin: EdgeInsets.all(10),
                              ),
                            );

                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class Doctorlist {
  const Doctorlist({ required this.image,required this.name,required this.Catagory,required this.reviws});

  final String image;
  final String name;
  final String Catagory;
  final String reviws;
}

const List<Doctorlist> choices = <Doctorlist>[
  Doctorlist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', Catagory: 'Dentist', reviws: '4.3(130 reviews)'),
  Doctorlist(image: 'assets/Image/doc/doc2.png', name: 'Dr jagdish', Catagory: 'Cardiologist', reviws: '4.3(130 reviews)'),
  Doctorlist(image: 'assets/Image/doc/doc3.png', name:'Dr joy', Catagory: 'Psychologist', reviws: '4.3(130 reviews)'),
  Doctorlist(image: 'assets/Image/doc/doc4.png', name: 'Dr watt', Catagory: 'Opthalmologist', reviws:'4.3(130 reviews)'),
  Doctorlist(image: 'assets/Image/doc/doc5.png', name: 'Dr.robert', Catagory: 'pulmonologist', reviws: '4.3(130 reviews)'),
  Doctorlist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', Catagory: 'Dentist', reviws: '4.3(130 reviews)'),
  Doctorlist(image:'assets/Image/doc/doc4.png', name: 'Dr robert', Catagory: 'Dentist', reviws: '4.3(130 reviews)'),

];

class Lablist {
  const Lablist({ required this.image,required this.name,required this.Location,required this.reviws});

  final String image;
  final String name;
  final String Location;
  final String reviws;
}

const List<Lablist> lab = <Lablist>[
  Lablist(image: "assets/Image/lab/lab1.png", name: 'LabCity', Location: 'Bhavnagar,gujrat', reviws: '4.3(130 reviews)'),
  Lablist(image: "assets/Image/lab/lab2.png", name: 'Lab', Location: 'Bhavnagar,gujrat', reviws: '4.3(130 reviews)'),
  Lablist(image:  "assets/Image/lab/lab3.png", name:'LabCity', Location: 'Bhavnagar,gujrat', reviws: '4.3(130 reviews)'),
  Lablist(image:  "assets/Image/lab/lab4.png", name: 'LabCity', Location: 'Bhavnagar,gujrat', reviws:'4.3(130 reviews)'),
  Lablist(image: "assets/Image/lab and doc/lab.png", name: 'LabCity', Location: 'Bhavnagar,gujrat', reviws: '4.3(130 reviews)'),
  Lablist(image:  "assets/Image/lab/lab2.png", name: 'LabCity',Location: 'Bhavnagar,gujrat', reviws: '4.3(130 reviews)'),
  Lablist(image:"assets/Image/lab/lab1.png", name: 'LabCity', Location: 'Bhavnagar,gujrat', reviws: '4.3(130 reviews)'),

];