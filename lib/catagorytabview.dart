import 'package:doctor_1/filters.dart';
import 'package:doctor_1/view%20all/catagoryfilters.dart';
import 'package:doctor_1/view%20all/docdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class tabcat extends StatefulWidget {

  @override
  _tabcatState createState() => _tabcatState();
}

class _tabcatState extends State<tabcat> with TickerProviderStateMixin {
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
    'Dentist',
    'Cardiologist',
    "Psychologist",
    'Opthalmologist',
    'Pulmonologist',
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
        appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
          centerTitle: true,
          title: Text('Catagory',style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
          leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
          actions: <Widget>[ Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(height: 50,width: 50,
              // padding: const EdgeInsets.all(15.0),
              // decoration: BoxDecoration(
              //     shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(8),border: Border.all( color: Colors.black45)),
              child: InkWell(borderRadius: BorderRadius.circular(8),
                child:Image.asset('assets/Image/lab and doc/filter.png',width:50,height: 50,),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>catagoryfilters()));
                },
              ),
            ),
          )],
        ),
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
         // Container(height: 50,color: Colors.blue,),
          // this is the TabBar
          Container(
              height: 50.0,
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
                              builder: (context, child) => FlatButton(
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
          SizedBox(height: 20,),
          Container(
            child: Flexible(
              // this will host our Tab Views
                child: TabBarView(
                  // and it is controlled by the controller
                  controller: _controller,
                  children: <Widget>[
                    // our Tab Views
                   // Text(_tab[0]),
                    Container(
                      // height: 210,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: doc1.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext ctx, i) {
                            return

                              Card( shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),),
                                child:
                                InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (Context)=>Doctor_Details()));},borderRadius: BorderRadius.circular(8),
                                  child: Padding(padding: EdgeInsets.all(10),child:
                                  Row(children: [
                                    Padding(
                                      padding:  EdgeInsets.only(right:10 ),
                                      child: Image.asset(doc1[i].image),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(doc1[i].name,style: TextStyle(fontFamily: "Montserrat Bold",)),
                                        SizedBox(height: 5,),
                                        Text(doc1[i].location,style: TextStyle(fontFamily: "Montserrat SemiBold"),),
                                        SizedBox(height: 5,),
                                        Row(children: [
                                          Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                                          Text(doc1[i].reviws,style: TextStyle(fontFamily: "Montserrat Medium",fontSize:12,color: Colors.black54 ),),
                                        ],),
                                      ],
                                    ),
                                  ],),),
                                ),
                              );
                          }),
                    ),
                    Container(
                      // height: 210,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: doc2.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext ctx, i) {
                            return
                      Flexible(child:Container(child:
                              Card( shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),),margin: EdgeInsets.all(10),
                                child:
                                InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (Context)=>Doctor_Details()));},borderRadius: BorderRadius.circular(8),
                                  child: Padding(padding: EdgeInsets.all(10),child:
                                  Row(children: [
                                    Padding(
                                      padding:  EdgeInsets.only(right:10 ),
                                      child: Image.asset(doc1[i].image),
                                    ),
                                    Expanded(flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(doc2[i].name,style: TextStyle(fontFamily: "Montserrat Bold",)),
                                          SizedBox(height: 5,),
                                          SizedBox(
                                            child: Text(doc2[i].location,style: TextStyle(fontFamily: "Montserrat SemiBold"),
                                                overflow: TextOverflow.clip,
                                                maxLines: 2,
                                                ),
                                          ),
                                          SizedBox(height: 5,),
                                          Row(children: [
                                            Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                                            Text(doc2[i].reviws,style: TextStyle(fontFamily: "Montserrat Medium",fontSize:12,color: Colors.black54 ),),
                                          ],),
                                        ],
                                      ),
                                    ),
                                  ],),),
                                ),
                              )));
                          }),
                    ),
                    Container(
                      // height: 210,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: doc3.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext ctx, i) {
                            return
                              Flexible(child:Container(child:
                              Card( shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),),margin: EdgeInsets.all(10),
                                child:
                                InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (Context)=>Doctor_Details()));},borderRadius: BorderRadius.circular(8),
                                  child: Padding(padding: EdgeInsets.all(10),child:
                                  Row(children: [
                                    Padding(
                                      padding:  EdgeInsets.only(right:10 ),
                                      child: Image.asset(doc3[i].image),
                                    ),
                                    Expanded(flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(doc3[i].name,style: TextStyle(fontFamily: "Montserrat Bold",)),
                                          SizedBox(height: 5,),
                                          SizedBox(
                                            child: Text(doc3[i].location,style: TextStyle(fontFamily: "Montserrat SemiBold"),
                                              overflow: TextOverflow.clip,
                                              maxLines: 2,
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Row(children: [
                                            Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                                            Text(doc2[i].reviws,style: TextStyle(fontFamily: "Montserrat Medium",fontSize:12,color: Colors.black54 ),),
                                          ],),
                                        ],
                                      ),
                                    ),
                                  ],),),
                                ),
                              )));
                          }),
                    ),
                    Container(
                      // height: 210,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: doc4.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext ctx, i) {
                            return
                              Flexible(child:Container(child:
                              Card( shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),),margin: EdgeInsets.all(10),
                                child:
                                InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (Context)=>Doctor_Details()));},borderRadius: BorderRadius.circular(8),
                                  child: Padding(padding: EdgeInsets.all(10),child:
                                  Row(children: [
                                    Padding(
                                      padding:  EdgeInsets.only(right:10 ),
                                      child: Image.asset(doc4[i].image),
                                    ),
                                    Expanded(flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(doc4[i].name,style: TextStyle(fontFamily: "Montserrat Bold",)),
                                          SizedBox(height: 5,),
                                          SizedBox(
                                            child: Text(doc4[i].location,style: TextStyle(fontFamily: "Montserrat SemiBold"),
                                              overflow: TextOverflow.clip,
                                              maxLines: 2,
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Row(children: [
                                            Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                                            Text(doc4[i].reviws,style: TextStyle(fontFamily: "Montserrat Medium",fontSize:12,color: Colors.black54 ),),
                                          ],),
                                        ],
                                      ),
                                    ),
                                  ],),),
                                ),
                              )));
                          }),
                    ),
                    Container(
                      // height: 210,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: doc5.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext ctx, i) {
                            return
                              Flexible(child:Container(child:
                              Card( shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),),margin: EdgeInsets.all(10),
                                child:
                                InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (Context)=>Doctor_Details()));},borderRadius: BorderRadius.circular(8),
                                  child: Padding(padding: EdgeInsets.all(10),child:
                                  Row(children: [
                                    Padding(
                                      padding:  EdgeInsets.only(right:10 ),
                                      child: Image.asset(doc5[i].image),
                                    ),
                                    Expanded(flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(doc5[i].name,style: TextStyle(fontFamily: "Montserrat Bold",)),
                                          SizedBox(height: 5,),
                                          SizedBox(
                                            child: Text(doc5[i].location,style: TextStyle(fontFamily: "Montserrat SemiBold"),
                                              overflow: TextOverflow.clip,
                                              maxLines: 2,
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Row(children: [
                                            Icon(Icons.star_rate_rounded,size: 15,color: Colors.amberAccent,),
                                            Text(doc5[i].reviws,style: TextStyle(fontFamily: "Montserrat Medium",fontSize:12,color: Colors.black54 ),),
                                          ],),
                                        ],
                                      ),
                                    ),
                                  ],),),
                                ),
                              )));
                          }),
                    ),


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
class denlist {
  denlist(
      {required this.image,
        required this.name,
        required this.location,
        required this.reviws});

  String image;
  String name;
  String location;
  String reviws;
}

List<denlist> doc1 = <denlist>[
  denlist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', location: 'Dentist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  denlist(image: 'assets/Image/doc/doc2.png', name: 'Dr.robert', location: 'Dentist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  denlist(image: 'assets/Image/doc/doc3.png', name: 'Dr.robert', location: 'Dentist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  denlist(image: 'assets/Image/doc/doc4.png', name: 'Dr.robert', location: 'Dentist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  denlist(image: 'assets/Image/doc/doc5.png', name: 'Dr.robert', location: 'Dentist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  denlist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', location: 'Dentist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  denlist(image: 'assets/Image/doc/doc2.png', name: 'Dr.robert', location: 'Dentist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  denlist(image: 'assets/Image/doc/doc3.png', name: 'Dr.robert', location: 'Dentist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),

];
class cardlist {
  cardlist(
      {required this.image,
        required this.name,
        required this.location,
        required this.reviws});

  String image;
  String name;
  String location;
  String reviws;
}

List<cardlist> doc2 = <cardlist>[
  cardlist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', location: 'Cardiologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  cardlist(image: 'assets/Image/doc/doc2.png', name: 'Dr.robert', location: 'Cardiologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  cardlist(image: 'assets/Image/doc/doc3.png', name: 'Dr.robert', location: 'Cardiologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  cardlist(image: 'assets/Image/doc/doc4.png', name: 'Dr.robert', location: 'Cardiologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  cardlist(image: 'assets/Image/doc/doc5.png', name: 'Dr.robert', location: 'Cardiologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  cardlist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', location: 'Cardiologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  cardlist(image: 'assets/Image/doc/doc2.png', name: 'Dr.robert', location: 'Cardiologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  cardlist(image: 'assets/Image/doc/doc3.png', name: 'Dr.robert', location: 'Cardiologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),

];
class psylist {
  psylist(
      {required this.image,
        required this.name,
        required this.location,
        required this.reviws});

  String image;
  String name;
  String location;
  String reviws;
}

List<psylist> doc3 = <psylist>[
  psylist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', location: 'psychologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  psylist(image: 'assets/Image/doc/doc2.png', name: 'Dr.robert', location: 'psychologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  psylist(image: 'assets/Image/doc/doc3.png', name: 'Dr.robert', location: 'psychologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  psylist(image: 'assets/Image/doc/doc4.png', name: 'Dr.robert', location: 'psychologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  psylist(image: 'assets/Image/doc/doc5.png', name: 'Dr.robert', location: 'psychologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  psylist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', location: 'psychologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  psylist(image: 'assets/Image/doc/doc2.png', name: 'Dr.robert', location: 'psychologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  psylist(image: 'assets/Image/doc/doc3.png', name: 'Dr.robert', location: 'psychologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),

];
class opthlist {
  opthlist(
      {required this.image,
        required this.name,
        required this.location,
        required this.reviws});

  String image;
  String name;
  String location;
  String reviws;
}

List<opthlist> doc4 = <opthlist>[
  opthlist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', location: 'Ophthalmologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  opthlist(image: 'assets/Image/doc/doc2.png', name: 'Dr.robert', location: 'Ophthalmologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  opthlist(image: 'assets/Image/doc/doc3.png', name: 'Dr.robert', location: 'Ophthalmologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  opthlist(image: 'assets/Image/doc/doc4.png', name: 'Dr.robert', location: 'Ophthalmologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  opthlist(image: 'assets/Image/doc/doc5.png', name: 'Dr.robert', location: 'Ophthalmologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  opthlist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', location: 'Ophthalmologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  opthlist(image: 'assets/Image/doc/doc2.png', name: 'Dr.robert', location: 'Ophthalmologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  opthlist(image: 'assets/Image/doc/doc3.png', name: 'Dr.robert', location: 'Ophthalmologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),

];
class pulmolist {
  pulmolist(
      {required this.image,
        required this.name,
        required this.location,
        required this.reviws});

  String image;
  String name;
  String location;
  String reviws;
}

List<pulmolist> doc5 = <pulmolist>[
  pulmolist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', location: 'Pulmonologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  pulmolist(image: 'assets/Image/doc/doc2.png', name: 'Dr.robert', location: 'Pulmonologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  pulmolist(image: 'assets/Image/doc/doc3.png', name: 'Dr.robert', location: 'Pulmonologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  pulmolist(image: 'assets/Image/doc/doc4.png', name: 'Dr.robert', location: 'Pulmonologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  pulmolist(image: 'assets/Image/doc/doc5.png', name: 'Dr.robert', location: 'Pulmonologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  pulmolist(image: 'assets/Image/doc/doc1.png', name: 'Dr.robert', location: 'Pulmonologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  pulmolist(image: 'assets/Image/doc/doc2.png', name: 'Dr.robert', location: 'Pulmonologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),
  pulmolist(image: 'assets/Image/doc/doc3.png', name: 'Dr.robert', location: 'Pulmonologist.Columbia Asia Hospital', reviws: '4.5(400 Reviews)'),

];