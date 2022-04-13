import 'package:doctor_1/ui/booking/Mybooking.dart';
import 'package:doctor_1/ui/Select_yourloc.dart';
import 'package:doctor_1/ui/catagorytabview.dart';
import 'package:doctor_1/ui/doctor.dart';
import 'package:doctor_1/ui/lab.dart';
import 'package:doctor_1/ui/menu_list/About_us.dart';
import 'package:doctor_1/ui/menu_list/Faqs.dart';
import 'package:doctor_1/ui/menu_list/contactus.dart';
import 'package:doctor_1/ui/notification.dart';
import 'package:doctor_1/ui/page3.dart';
import 'package:doctor_1/ui/profile/profile.dart';
import 'package:doctor_1/ui/search.dart';
import 'package:doctor_1/ui/view%20all/category.dart';
import 'package:doctor_1/ui/view%20all/doctorview.dart';
import 'package:doctor_1/ui/view%20all/labdetails.dart';
import 'package:doctor_1/ui/view%20all/labview.dart';
import 'package:doctor_1/ui/view%20all/docdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import '../Select_yourloc.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({Key? key}) : super(key: key);

  @override
  State<Bottomnavigation> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Bottomnavigation> {
  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }


  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      title: Center(
        child: Column(
            children:[
              Image.asset('assets/Image/Group 16820.jpg',
                width: 50, height: 50, fit: BoxFit.contain,),
              const Text('Please confirm',style: TextStyle(fontFamily:"Montserrat SemiBold"),),
              const Padding(padding: EdgeInsets.only(bottom: 10),),
              const Text('Do you want to exit the app?',textAlign: TextAlign.center,
                style: TextStyle(color:Colors.black26,fontFamily: "Montserrat Medium",fontSize: 16 ),),

            ]
        ),
      ),
      actions: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlineButton(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("No",style: TextStyle(color: Colors.blue,fontFamily: "Montserrat Medium"),),
                ),borderSide: BorderSide(color: Colors.blue),
                onPressed: () => Navigator.of(context).pop(false),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
            ),

            ElevatedButton(
              onPressed: ()  => Navigator.of(context).pop(true),

              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('yes',style: TextStyle(fontFamily: "Montserrat Medium"),),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
            ),
          ],
        ),
      ],
      //  title: Text("Verification Code"),


    );
  }
  int _selectedIndex = 0;
  //static TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _pages = <Widget>[
    const home_1(),
    const My_bookings(),
    const profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _advancedDrawerController = AdvancedDrawerController();
  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: const Color(0xFF2492EC),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 250),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child:  WillPopScope(
    onWillPop: () => _onWillPop(context),
    child:
      Scaffold(
        appBar:_selectedIndex==0? AppBar(
          toolbarHeight: 70,
          title: Column(
            children: [
              Container(
                width: 40,
                child: Image.asset(
                  'assets/Image/icons/plusblue.png',
                ),
              ),
              const SizedBox(height: 10),
              Visibility(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 15,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Sel_yourloc()));
                        },
                        child: const Text(
                          'Ahmedabad,india',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Montserrat SemiBold",
                              fontSize: 16),
                        )),
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
                      duration: const Duration(milliseconds: 250),
                      child: Image.asset(
                        value.visible
                            ? 'assets/Image/icons/can.png'
                            : 'assets/Image/icons/menu2.png',
                        filterQuality: FilterQuality.none,
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
              builder: (context) {
                return Column(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/Image/icons/notification1.png',
                        filterQuality: FilterQuality.high,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => notification()));
                      },
                    ),
                  ],
                );
              },
            )
          ],
        ):(_selectedIndex == 1  ? AppBar(
            toolbarHeight: 70,
            title: Column(
              children: [
                Container(
                  width: 40,
                  child: Image.asset(
                    'assets/Image/icons/plusblue.png',
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
                        duration: const Duration(milliseconds: 250),
                        child: Image.asset(
                          value.visible
                              ? 'assets/Image/icons/can.png'
                              : 'assets/Image/icons/menu2.png',
                          filterQuality: FilterQuality.none,
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


        ):AppBar(
            toolbarHeight: 70,
            title:      const Text(
              "Profile",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat Bold"),
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
                        duration: const Duration(milliseconds: 250),
                        child: Image.asset(
                          value.visible
                              ? 'assets/Image/icons/can.png'
                              : 'assets/Image/icons/menu2.png',
                          filterQuality: FilterQuality.none,
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


        )),
      //   AppBar(
      // )? AppBar()),
        body: Container(
          //   height: MediaQuery.of(context).size.height,
          // padding: EdgeInsets.all(28),
          child: _pages.elementAt(_selectedIndex),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SafeArea(
          child: Container(
            //height: 100,//height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10,
                  spreadRadius: 0,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              //child: BottomNavigationBar(backgroundColor: Colors.white,),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,

                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/Image/bottomnavigation/hm.png',
                      height: 20,
                      color: (_selectedIndex == 0)
                          ? const Color(0xFF2492EC)
                          : Colors.black12,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/Image/bottomnavigation/mybus.png',
                      height: 20,
                      color: (_selectedIndex == 1)
                          ? const Color(0xFF2492EC)
                          : Colors.black12,
                    ),
                    //Icon(Icons.calendar_today_rounded),
                    label: 'My Bookings',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/Image/bottomnavigation/profie.png',
                      height: 20,
                      color: (_selectedIndex == 2)
                          ? const Color(0xFF2492EC)
                          : Colors.black12,
                    ),
                    label: 'Profile',
                  ),
                ],
                currentIndex: _selectedIndex,

                selectedItemColor: const Color(0xFF2492EC),
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
      )),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 0.00,
                    bottom: 25.0,
                  ),
                  height: 100,
                  child: InkWell( onTap: (){},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 2 ;
                              //    var jumpToPage = _selectedIndex.jumpToPage(3);
                                //  Navigator.pop(context);

                                //  profile();
                                });
                              },
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/Image/doc/doc1.png',
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                        //    SizedBox(width: 16),

                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Dr.robert",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: "Montserrat Bold"),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "+91 9898637845",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: "Montserrat SemiBold"),
                              ),
                            ]),
                      ],
                    ),
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
                  onTap: () {
                    setState(() {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>const profile()));
                      //home_1();
                    //  profile();
                      _selectedIndex=0;
                    });


                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
                    },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
                //
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Contact_us()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  leading: const Icon(Icons.headset_mic_outlined),
                  title: const Text('Contact Us',
                      style: TextStyle(fontFamily: "Montserrat Medium")),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const About_us()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  leading: const Icon(Icons.announcement),
                  title: const Text('About Us',
                      style: TextStyle(fontFamily: "Montserrat Medium")),
                ),
                ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Faqs()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    leading: const Icon(Icons.question_answer_outlined),
                    title: const Text("FAQ's",
                        style: TextStyle(fontFamily: "Montserrat Medium"))),
                ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    leading: const Icon(Icons.circle),
                    title: const Text("Terms & Condition ",
                        style: TextStyle(fontFamily: "Montserrat Medium"))),
                ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    leading: const Icon(Icons.star_rate),
                    title: const Text("Rate Us",
                        style: TextStyle(fontFamily: "Montserrat Medium"))),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 20),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const p3()));
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                                fontFamily: "Montserrat Medium",
                                color: Colors.white,
                                fontSize: 16),
                          )),
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
}

class home_1 extends StatefulWidget {
  const home_1({Key? key}) : super(key: key);

  @override
  _home_1State createState() => _home_1State();
}

class _home_1State extends State<home_1> {
  final controller = ScrollController();
  int index = 0;
  void scrollDown() {
    final double end = controller.position.maxScrollExtent;
    controller.animateTo(end,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }

  Widget container(String Img, String text, dynamic color) {
    return Container(
      width: 122.h,
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => tabcat()));
          },
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                Img,
                height: 25,
              ),
              Text(
                text,
                style:
                    TextStyle(fontFamily: "Montserrat Medium", fontSize: 13.sp),
              ),
            ],
          ),
        ),
        //   semanticContainer: true,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // elevation: 5,
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  //https://cdn3.iconfinder.com/data/icons/male-user-icons/500/muser-dr1-512.png"Dr.robert""Dentist""4.5(130 reviews)"
  Widget container2(
    String imgdoc,
    String i1,
    String i2,
    String i3,
  ) {
    return Container(
      width: 160,
      child: Card(
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imgdoc,
                height: 100,
              ),
              Text(
                i1,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat SemiBold"),
              ),
              Text(
                i2,
                style: const TextStyle(fontFamily: "Montserrat Medium"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 15,
                    color: Colors.amberAccent,
                  ),
                  Text(
                    i3,
                    style: const TextStyle(
                        fontFamily: "Montserrat Medium",
                        color: Colors.black54,
                        fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
        //   semanticContainer: true,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // elevation: 5,
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  Widget container3(
    String imglab,
    String i1,
    String i2,
    String i3,
  ) {
    return Container(
      width: 160,
      child: Card(
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imglab,
                height: 100,
              ),
              Text(
                i1,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat SemiBold"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 13,
                  ),
                  Text(
                    i2,
                    style: const TextStyle(fontFamily: "Montserrat Medium"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 15,
                    color: Colors.amberAccent,
                  ),
                  Text(
                    i3,
                    style: const TextStyle(
                        fontFamily: "Montserrat Medium",
                        fontSize: 12,
                        color: Colors.black54),
                  ),
                ],
              )
            ],
          ),
        ),
        //   semanticContainer: true,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        // elevation: 5,
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const search()));
              },
              child: Row(children: [
                Expanded(
                  child: Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.7.w,
                            color: Colors.black12,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.search,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Enter a search term...',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Montserrat Medium'),
                            ),
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
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Well Set",
                          style: TextStyle(
                              fontSize: 20, fontFamily: "Montserrat SemiBold"),
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 5)),
                  Container(
                    height: 150,
                    child: Row(
                      children: [
                        Expanded(
                          child: Material(
                              child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const doctor()));
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('assets/Image/Group 93056.png',
                                      cacheHeight: 100
                                      //filterQuality: FilterQuality.high,cacheHeight: 100,
                                      ),
                                  const Text(
                                    "Doctor",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Montserrat Medium"),
                                  )
                                ],
                              ),
                            ),
                          )),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 10, left: 10)),
                        Expanded(
                            child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Lab()));
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/Image/icons/lab1.png',
                                  filterQuality: FilterQuality.high,
                                  cacheHeight: 100,
                                ),
                                const Text(
                                  "Lab",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Montserrat Medium"),
                                )
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Category",
                          style: TextStyle(
                              fontSize: 16, fontFamily: "Montserrat SemiBold"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const category()));
                          },
                          child: Row(
                            children: const [
                              Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat Medium"),
                              ),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        container("assets/Image/icons/teeth.png", "dentist",
                            const Color(0xFFe3effa)),
                        container("assets/Image/icons/redh.png", "Cardiologist",
                            const Color(0xFFfadcd4)),
                        container("assets/Image/icons/brain.png",
                            "psychologist", const Color(0xFFfae7ca)),
                        container("assets/Image/icons/eye.png",
                            "opthalmologist", const Color(0xFFedfff6)),
                        container("assets/Image/icons/lungs.png", "pulmologist",
                            const Color(0xFFddffd6)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Featured Doctor",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat SemiBold"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const doclist()));
                          },
                          child: Row(
                            children: const [
                              Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat Medium"),
                              ),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
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
                  Container(
                    height: 210,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: choices.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctx, i) {
                          return SizedBox(
                            height: 200,
                            width: 160,
                            child: Card(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Doctor_Details()));
                                },
                                borderRadius: BorderRadius.circular(0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      choices[i].image,
                                      height: 100.h,
                                    ),
                                    Text(
                                      choices[i].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Montserrat SemiBold"),
                                    ),
                                    Text(
                                      choices[i].Catagory,
                                      style: const TextStyle(
                                          fontFamily: "Montserrat Medium"),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star_rate_rounded,
                                          size: 15.sp,
                                          color: Colors.amberAccent,
                                        ),
                                        Text(
                                          choices[i].reviws,
                                          style: TextStyle(
                                              fontFamily: "Montserrat Medium",
                                              color: Colors.black54,
                                              fontSize: 12.sp),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              //   semanticContainer: true,
                              // clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              // elevation: 5,
                              margin: const EdgeInsets.all(10),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Featured Lab",
                          style: TextStyle(
                              fontSize: 16, fontFamily: "Montserrat SemiBold"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const labview()));
                          },
                          child: Row(
                            children: const [
                              Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Montserrat Medium"),
                              ),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 210,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: lab.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctx, i) {
                          return Container(
                            height: 200,
                            width: 160,
                            child: Card(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Lab_Details()));
                                },
                                borderRadius: BorderRadius.circular(0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      lab[i].image,
                                      height: 100.h,
                                    ),
                                    Text(
                                      lab[i].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Montserrat SemiBold",
                                          fontSize: 15.sp),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 13.h,
                                        ),
                                        Text(
                                          lab[i].Location,
                                          style: TextStyle(
                                              fontFamily: "Montserrat Medium",
                                              fontSize: 13.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star_rate_rounded,
                                          size: 15,
                                          color: Colors.amberAccent,
                                        ),
                                        Text(
                                          lab[i].reviws,
                                          style: TextStyle(
                                              fontFamily: "Montserrat Medium",
                                              color: Colors.black54,
                                              fontSize: 12.sp),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              //   semanticContainer: true,
                              // clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              // elevation: 5,
                              margin: const EdgeInsets.all(10),
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
  const Doctorlist(
      {required this.image,
      required this.name,
      required this.Catagory,
      required this.reviws});

  final String image;
  final String name;
  final String Catagory;
  final String reviws;
}

const List<Doctorlist> choices = <Doctorlist>[
  Doctorlist(
      image: 'assets/Image/doc/doc1.png',
      name: 'Dr.robert',
      Catagory: 'Dentist',
      reviws: '4.3(130 reviews)'),
  Doctorlist(
      image: 'assets/Image/doc/doc2.png',
      name: 'Dr jagdish',
      Catagory: 'Cardiologist',
      reviws: '4.3(130 reviews)'),
  Doctorlist(
      image: 'assets/Image/doc/doc3.png',
      name: 'Dr joy',
      Catagory: 'Psychologist',
      reviws: '4.3(130 reviews)'),
  Doctorlist(
      image: 'assets/Image/doc/doc4.png',
      name: 'Dr watt',
      Catagory: 'Opthalmologist',
      reviws: '4.3(130 reviews)'),
  Doctorlist(
      image: 'assets/Image/doc/doc5.png',
      name: 'Dr.robert',
      Catagory: 'pulmonologist',
      reviws: '4.3(130 reviews)'),
  Doctorlist(
      image: 'assets/Image/doc/doc1.png',
      name: 'Dr.robert',
      Catagory: 'Dentist',
      reviws: '4.3(130 reviews)'),
  Doctorlist(
      image: 'assets/Image/doc/doc4.png',
      name: 'Dr robert',
      Catagory: 'Dentist',
      reviws: '4.3(130 reviews)'),
];

class Lablist {
  const Lablist(
      {required this.image,
      required this.name,
      required this.Location,
      required this.reviws});

  final String image;
  final String name;
  final String Location;
  final String reviws;
}

const List<Lablist> lab = <Lablist>[
  Lablist(
      image: "assets/Image/lab/lab1.png",
      name: 'LabCity',
      Location: 'Bhavnagar,Gujarat',
      reviws: '4.3(130 reviews)'),
  Lablist(
      image: "assets/Image/lab/lab2.png",
      name: 'Lab',
      Location: 'Bhavnagar,Gujarat',
      reviws: '4.3(130 reviews)'),
  Lablist(
      image: "assets/Image/lab/lab3.png",
      name: 'LabCity',
      Location: 'Bhavnagar,Gujarat',
      reviws: '4.3(130 reviews)'),
  Lablist(
      image: "assets/Image/lab/lab4.png",
      name: 'LabCity',
      Location: 'Bhavnagar,Gujarat',
      reviws: '4.3(130 reviews)'),
  Lablist(
      image: "assets/Image/lab and doc/lab.png",
      name: 'LabCity',
      Location: 'Bhavnagar,Gujarat',
      reviws: '4.3(130 reviews)'),
  Lablist(
      image: "assets/Image/lab/lab2.png",
      name: 'LabCity',
      Location: 'Bhavnagar,Gujarat',
      reviws: '4.3(130 reviews)'),
  Lablist(
      image: "assets/Image/lab/lab1.png",
      name: 'LabCity',
      Location: 'Bhavnagar,Gujarat',
      reviws: '4.3(130 reviews)'),
];
