import 'package:doctor_1/booking/MyBooking_filter.dart';
import 'package:doctor_1/view%20all/labdetails.dart';
import 'package:flutter/material.dart';
import 'package:doctor_1/view%20all/docdetails.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

import '../Appointment Detail/lab_Appoint.dart';
class My_bookings extends StatefulWidget {
  const My_bookings({Key? key}) : super(key: key);

  @override
  State<My_bookings> createState() => _My_bookingsState();
}

class _My_bookingsState extends State<My_bookings> with TickerProviderStateMixin {
  // TickerProviderStateMixin allows the fade out/fade in animation when changing the active button

  // this will control the button clicks and tab changing
  late TabController _controller;

  // this will control the animation when a button changes from an off state to an on state
  late AnimationController _animationControllerOn;

  // this will control the animation when a button changes from an on state to an off state
  late AnimationController _animationControllerOff;

  // this will give the background color values of a button when it changes to an on state
  late Animation _colorTweenBackgroundOn;
  late Animation _colorTweenBackgroundOff;

  // this will give the foreground color values of a button when it changes to an on state
  late Animation _colorTweenForegroundOn;
  late Animation _colorTweenForegroundOff;

  // when swiping, the _controller.index value only changes after the animation, therefore, we need this to trigger the animations and save the current index
  int _currentIndex = 0;

  // saves the previous active tab
  int _prevControllerIndex = 0;

  // saves the value of the tab animation. For example, if one is between the 1st and the 2nd tab, this value will be 0.5
  double _aniValue = 0.0;

  // saves the previous value of the tab animation. It's used to figure the direction of the animation
  double _prevAniValue = 0.0;

  // these will be our tab icons. You can use whatever you like for the content of your buttons
  List _tab = [
    'Upcoming',
    'Ongoing',
    'Past'
  ];

  // active button's foreground color
  Color _foregroundOn = Colors.white;
  Color _foregroundOff = Colors.black;

  // active button's background color
  Color _backgroundOn = Colors.blue;
  Color _backgroundOff = Colors.white;

  // scroll controller for the TabBar
  ScrollController _scrollController = new ScrollController();

  // this will save the keys for each Tab in the Tab Bar, so we can retrieve their position and size for the scroll controller
  List _keys = [];

  // regist if the the button was tapped
  bool _buttonTap = false;

  @override
  void initState() {
    super.initState();

    for (int index = 0; index < _tab.length; index++) {
      // create a GlobalKey for each Tab
      _keys.add(new GlobalKey());
    }

    // this creates the controller with 6 tabs (in our case)
    _controller = TabController(vsync: this, length: _tab.length);
    // this will execute the function every time there's a swipe animation
    _controller.animation?.addListener(_handleTabAnimation);
    // this will execute the function every time the _controller.index value changes
    _controller.addListener(_handleTabChange);

    _animationControllerOff =
        AnimationController(vsync: this, duration: Duration(milliseconds: 75));
    // so the inactive buttons start in their "final" state (color)
    _animationControllerOff.value = 1.0;
    _colorTweenBackgroundOff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(_animationControllerOff);
    _colorTweenForegroundOff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(_animationControllerOff);

    _animationControllerOn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    // so the inactive buttons start in their "final" state (color)
    _animationControllerOn.value = 1.0;
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    _colorTweenForegroundOn =
        ColorTween(begin: _foregroundOff, end: _foregroundOn)
            .animate(_animationControllerOn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Text('My_bookings',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 20),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(borderRadius: BorderRadius.circular(8),
                  child:Image.asset('assets/Image/lab and doc/filter.png',width:50,height: 50,),
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBooking_filter()));
                  },
                ),
              ),
            ],
          ),
          Row(children:<Widget>[
            Expanded(
              child: Container(
                  height: 60.0,
                  //width: MediaQuery.of(context).size.width * 0.50,
                  // this generates our tabs buttons
                  child: ListView.builder(
                    // this gives the TabBar a bounce effect when scrolling farther than it's size
                      physics: BouncingScrollPhysics(),
                      controller: _scrollController,
                      // make the list horizontal
                      scrollDirection: Axis.horizontal,
                      // number of tabs
                      itemCount: _tab.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          // each button's key
                            key: _keys[index],
                            // padding for the buttons
                            padding: EdgeInsets.all(6.0),
                            child: ButtonTheme(
                                child: AnimatedBuilder(
                                  animation: _colorTweenBackgroundOn,
                                  builder: (context, child) => FlatButton(minWidth: MediaQuery.of(context).size.width * 0.30,
                                      // get the color of the button's background (dependent of its state)
                                      color: _getBackgroundColor(index),
                                      // make the button a rectangle with round corners
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),

                                        side: BorderSide(color: Colors.black12, width: 1 ),
                                      ),
                                      // shape: RoundedRectangleBorder(
                                      //     borderRadius: new BorderRadius.circular(7.0)),
                                      onPressed: () {
                                        setState(() {
                                          _buttonTap = true;
                                          // trigger the controller to change between Tab Views
                                          _controller.animateTo(index);
                                          // set the current index
                                          _setCurrentIndex(index);
                                          // scroll to the tapped button (needed if we tap the active button and it's not on its position)
                                          _scrollTo(index);
                                        });
                                      },
                                      child: Text(
                                        // get the icon
                                        _tab[index],style: TextStyle(color:_getForegroundColor(index) ,fontSize: 12,fontFamily: 'Montserrat Medium'),
                                        // get the color of the icon (dependent of its state)
                                        // color: _getForegroundColor(index),
                                      )),
                                )));
                      })),
            ),]),
          //  SizedBox(height: 20,),
          Container(
            child: Flexible(
              // this will host our Tab Views
                child: TabBarView(
                  // and it is controlled by the controller
                  controller: _controller,
                  children: <Widget>[
                    // our Tab Views
                    // Text(_tab[0]),

                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: up.length,
                        itemBuilder: (BuildContext ctx, j) {
                          return  
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(//height: 160.h,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.7.w,
                                      color: Colors.black12,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20.r))
                                ),
                                child: InkWell(onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>up[j].fun));
                                },borderRadius: BorderRadius.circular(20.r),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        SizedBox(height: 5,),
                                        Row(mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(

                                              margin: EdgeInsets.all(5),
                                              width: 70.w,
                                              height: 70.h,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(16),
                                                child: Image.asset(up[j].image),
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.all(5,)),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 20),
                                                child: Column(
                                                  children: [
                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          up[j].name,style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 16.sp),),
                                                        Text(
                                                          up[j].Accept,style: TextStyle(fontFamily: 'Montserrat Medium',color: up[j].color),),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top:5.0,bottom: 5,),
                                                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 8.0),
                                                            child: Image.asset('assets/Image/bottomnavigation/mybus.png',color: Colors.black,height: 16.h,),
                                                          ),
                                                          Text(
                                                            up[j].date,style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff6B779A)),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 5.0,bottom: 5,right: 5),
                                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 8.0),
                                                            child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(right: 5.0),
                                                                  child: Icon(Icons.watch_later,color: Colors.black,size: 16.sp,),
                                                                ),
                                                                Text(
                                                                  up[j].time,style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff6B779A)),),
                                                              ],
                                                            )
                                                          ),
                                                          Text(
                                                            up[j].rs,style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff2492EC)),),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),

                              ),
                            );

                        }),


                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: r2.length,
                        itemBuilder: (BuildContext ctx, j) {
                          return
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(//height: 160.h,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.7.w,
                                      color: Colors.black12,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20.r))
                                ),
                                child: InkWell(onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>r2[j].fun));
                                },borderRadius: BorderRadius.circular(20.r),

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        SizedBox(height: 5,),
                                        Row(mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                            Padding(padding: EdgeInsets.all(5,)),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 20),
                                                child: Column(
                                                  children: [
                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          r2[j].name ,style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 16.sp),),
                                                        Text(
                                                          r2[j].ongoing,style: TextStyle(fontFamily: 'Montserrat Medium',color: r2[j].color),),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 8.0),
                                                            child: Image.asset('assets/Image/bottomnavigation/mybus.png',color: Colors.black,height: 16.h,),
                                                          ),
                                                          Text(
                                                            r2[j].date,style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff6B779A)),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Padding(
                                                              padding: const EdgeInsets.only(right: 8.0),
                                                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Icon(Icons.watch_later,color: Colors.black,size: 16.sp,),
                                                                  Text(
                                                                    r2[j].time,style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff6B779A)),),
                                                                ],
                                                              )
                                                          ),
                                                          Text(
                                                            r2[j].rs,style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff2492EC)),),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),

                              ),
                            );

                        }),


                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: past.length,
                        itemBuilder: (BuildContext ctx, j) {
                          return
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(//height: 160.h,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.7.w,
                                      color: Colors.black12,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20.r))
                                ),
                                child: InkWell(onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>past[j].fun));
                                },borderRadius: BorderRadius.circular(20.r),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        SizedBox(height: 5,),
                                        Row(mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(

                                              margin: EdgeInsets.all(5),
                                              width: 70.w,
                                              height: 70.h,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(16),
                                                child: Image.asset(past[j].image),
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.all(5,)),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 20),
                                                child: Column(
                                                  children: [
                                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          past[j].name ,style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black,fontSize: 16.sp),),
                                                        Text(
                                                          past[j].Accept,style: TextStyle(fontFamily: 'Montserrat Medium',color: past[j].color),),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(right: 8.0),
                                                            child: Image.asset('assets/Image/bottomnavigation/mybus.png',color: Colors.black,height: 16.h,),
                                                          ),
                                                          Text(
                                                            past[j].date,style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff6B779A)),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Padding(
                                                              padding: const EdgeInsets.only(right: 8.0),
                                                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Icon(Icons.watch_later,color: Colors.black,size: 16.sp,),
                                                                  Text(
                                                                    past[j].time,style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff6B779A)),),
                                                                ],
                                                              )
                                                          ),
                                                          Text(
                                                            r2[j].rs,style: TextStyle(fontFamily: 'Montserrat Medium',color: Color(0xff2492EC)),),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),

                              ),
                            );

                        }),
                  ],
                )),
          ),
        ]));
  }

  // runs during the switching tabs animation
  _handleTabAnimation() {
    // gets the value of the animation. For example, if one is between the 1st and the 2nd tab, this value will be 0.5
    _aniValue = _controller.animation!.value;

    // if the button wasn't pressed, which means the user is swiping, and the amount swipped is less than 1 (this means that we're swiping through neighbor Tab Views)
    if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
      // set the current tab index
      _setCurrentIndex(_aniValue.round());
    }

    // save the previous Animation Value
    _prevAniValue = _aniValue;
  }

  // runs when the displayed tab changes
  _handleTabChange() {
    // if a button was tapped, change the current index
    if (_buttonTap) _setCurrentIndex(_controller.index);

    // this resets the button tap
    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _aniValue.round())) _buttonTap = false;

    // save the previous controller index
    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    // if we're actually changing the index
    if (index != _currentIndex) {
      setState(() {
        // change the index
        _currentIndex = index;
      });

      // trigger the button animation
      _triggerAnimation();
      // scroll the TabBar to the correct position (if we have a scrollable bar)
      _scrollTo(index);
    }
  }

  _triggerAnimation() {
    // reset the animations so they're ready to go
    _animationControllerOn.reset();
    _animationControllerOff.reset();

    // run the animations!
    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _scrollTo(int index) {
    // get the screen width. This is used to check if we have an element off screen
    double screenWidth = MediaQuery.of(context).size.width;

    // get the button we want to scroll to
    RenderBox renderBox = _keys[index].currentContext.findRenderObject();
    // get its size
    double size = renderBox.size.width;
    // and position
    double position = renderBox.localToGlobal(Offset.zero).dx;

    // this is how much the button is away from the center of the screen and how much we must scroll to get it into place
    double offset = (position + size / 2) - screenWidth / 2;

    // if the button is to the left of the middle
    if (offset < 0) {
      // get the first button
      renderBox = _keys[0].currentContext.findRenderObject();
      // get the position of the first button of the TabBar
      position = renderBox.localToGlobal(Offset.zero).dx;

      // if the offset pulls the first button away from the left side, we limit that movement so the first button is stuck to the left side
      if (position > offset) offset = position;
    } else {
      // if the button is to the right of the middle

      // get the last button
      renderBox = _keys[_tab.length - 1].currentContext.findRenderObject();
      // get its position
      position = renderBox.localToGlobal(Offset.zero).dx;
      // and size
      size = renderBox.size.width;

      // if the last button doesn't reach the right side, use it's right side as the limit of the screen for the TabBar
      if (position + size < screenWidth) screenWidth = position + size;

      // if the offset pulls the last button away from the right side limit, we reduce that movement so the last button is stuck to the right side limit
      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }

    // scroll the calculated ammount
    _scrollController.animateTo(offset + _scrollController.offset,
        duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      // if it's active button
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      // if it's the previous active button
      return _colorTweenBackgroundOff.value;
    } else {
      // if the button is inactive
      return _backgroundOff;
    }
  }

  _getForegroundColor(int index) {
    // the same as the above
    if (index == _currentIndex) {
      return _colorTweenForegroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenForegroundOff.value;
    } else {
      return _foregroundOff;
    }
  }
}

class ongoinglist {
  ongoinglist(
      {required this.image,
        required this.name,
        required this.ongoing,
        required this.color,
        required this.date,
        required this.time,
        required this.rs,
        required this.fun,
      });

  String image;
  String name ;
  String ongoing;
  dynamic color;
  String date;
  String time;
  String rs;
  dynamic fun;

}

List<ongoinglist> r2 = <ongoinglist>[
  //userlist(image: 'assets/Image/lab/lab1.png', name: 'Dr. Bellamy N', review: review, rating: rating, date: date, color: color)
  ongoinglist(image: 'assets/Image/doc/doc2.png', name: 'Dr. Bellamy N', ongoing: 'ongoing', color:  Color(0xffA584FF), date: '27th Oct, 2021', time: '11:30 am', rs: '₹300',fun: Lab_appointdet()),
  ongoinglist(image: 'assets/Image/doc/doc1.png', name: 'Dr. Bellamy N', ongoing: 'ongoing', color:  Color(0xffA584FF), date: '27th Oct, 2021', time: '11:30 am', rs: '₹300',fun: Lab_appointdet()),
  ongoinglist(image: 'assets/Image/doc/doc3.png', name: 'Dr. Bellamy N', ongoing: 'ongoing', color:  Color(0xffA584FF), date: '27th Oct, 2021', time: '11:30 am', rs: '₹300',fun: Lab_appointdet()),
  ongoinglist(image: 'assets/Image/lab/lab1.png', name: 'LabCity', ongoing: 'ongoing', color:  Color(0xffA584FF), date: '27th Oct, 2021', time: '11:30 am', rs: '₹300',fun: Lab_appointdet()),
  ongoinglist(image: 'assets/Image/lab/lab2.png', name: 'LabCity', ongoing: 'ongoing', color:  Color(0xff2492EC), date: '27th Oct, 2021', time: '11:30 am', rs: '₹300',fun: Lab_appointdet()),



];
class upcomelist {
  upcomelist(
      {required this.image,
        required this.name,
        required this.Accept,
        required this.color,
        required this.date,
        required this.time,
        required this.rs,
        required this.fun,
      });

  String image;
  String name ;
  String Accept;
  dynamic color;
  String date;
  String time;
  String rs;
  dynamic fun;

}

List<upcomelist> up = <upcomelist>[
  //userlist(image: 'assets/Image/lab/lab1.png', name: 'Dr. Bellamy N', review: review, rating: rating, date: date, color: color)
  upcomelist(image: 'assets/Image/doc/doc2.png', name: 'Dr. Bellamy N', Accept: 'Accepted', color:  Color(0xff00CC6A), date: '27th Oct, 2021', time: '11:30 am', rs: '₹300',fun: Lab_appointdet()),
  upcomelist(image: 'assets/Image/doc/doc1.png', name: 'Dr. Bellamy N', Accept: 'Pending', color:  Color(0xffFEA725), date: '27th Oct, 2021', time: '11:30 am', rs: '₹900',fun: Lab_appointdet()),
  upcomelist(image: 'assets/Image/doc/doc3.png', name: 'Dr. Bellamy N', Accept: 'Accepted', color:  Color(0xff00CC6A), date: '27th Oct, 2021', time: '11:30 am', rs: '₹500',fun: Lab_appointdet()),
  upcomelist(image: 'assets/Image/lab/lab1.png', name: 'LabCity', Accept: 'Pending', color:  Color(0xffFEA725), date: '27th Oct, 2021', time: '11:30 am', rs: '₹700',fun: Lab_appointdet()),
  upcomelist(image: 'assets/Image/lab/lab2.png', name: 'LabCity', Accept: 'Accepted', color:  Color(0xff00CC6A), date: '27th Oct, 2021', time: '11:30 am', rs: '₹800',fun: Lab_appointdet()),



];
class pastlist {
  pastlist(
      {required this.image,
        required this.name,
        required this.Accept,
        required this.color,
        required this.date,
        required this.time,
        required this.rs,
        required this.fun,
      });

  String image;
  String name ;
  String Accept;
  dynamic color;
  String date;
  String time;
  String rs;
  dynamic fun;

}

List<pastlist> past = <pastlist>[
  //userlist(image: 'assets/Image/lab/lab1.png', name: 'Dr. Bellamy N', review: review, rating: rating, date: date, color: color)
  pastlist(image: 'assets/Image/doc/doc2.png', name: 'Dr. Bellamy N', Accept: 'Completed', color:  Color(0xff2492EC), date: '27th Oct, 2021', time: '11:30 am', rs: '₹300',fun: Lab_appointdet()),
  pastlist(image: 'assets/Image/doc/doc1.png', name: 'Dr. Bellamy N', Accept: 'Rejected', color:  Color(0xffFF3B30), date: '27th Oct, 2021', time: '11:30 am', rs: '₹900',fun: Lab_appointdet()),
  pastlist(image: 'assets/Image/doc/doc3.png', name: 'Dr. Bellamy N', Accept: 'Rejected', color:  Color(0xffFF3B30), date: '27th Oct, 2021', time: '11:30 am', rs: '₹500',fun: Lab_appointdet()),
  pastlist(image: 'assets/Image/lab/lab1.png', name: 'LabCity', Accept: 'Completed', color:  Color(0xff2492EC), date: '27th Oct, 2021', time: '11:30 am', rs: '₹700',fun: Lab_appointdet()),
  pastlist(image: 'assets/Image/lab/lab2.png', name: 'LabCity', Accept: 'Cancelled', color:  Color(0xffFF3B30), date: '27th Oct, 2021', time: '11:30 am', rs: '₹800',fun: Lab_appointdet()),



];