// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class notification extends StatelessWidget {
//   final ScrollController _scrollController = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//       AppBar(
//         elevation: 00,
//         backgroundColor: Colors.transparent,
//         centerTitle: true,title: Text("Notification",style: TextStyle(color: Colors.black),),
//         leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon( Icons.arrow_back,color: Colors.black,)),),
//
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView.builder(physics: const BouncingScrollPhysics(),
//           controller: _scrollController,
//           itemCount: 10,
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               height: 100,
//               child: Card(child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   children: [
//                     Text("You Have Successfully Bookde your Appointment.!",style: TextStyle(fontFamily: "Montserrat SemiBold",fontSize:12)),
//                     SizedBox(height: 8,),
//                     Row(children: [
//                       Image.asset('assets/Image/icons/notification1.png',height: 20,),
//                       Text("2 Min ago",style: TextStyle(fontFamily: "Montserrat Medium",fontSize:12,color: Colors.black54 ),),
//                     ],),
//                   ],
//                 ),
//
//               ),
//                 semanticContainer: true,
//                 clipBehavior: Clip.antiAliasWithSaveLayer,
//                 color: Colors.white,
//                 // fit: BoxFit.fill,),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 elevation: 5,
//                 margin: EdgeInsets.all(10),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';



class Model {
  String id = UniqueKey().toString();
  int index = 0;

  @override
  String toString() {
    return index.toString();
  }
}

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  List<Model> list = List.generate(30, (index) {
    return Model()..index = index;
  });

  late SwipeActionController controller;

  @override
  void initState() {
    super.initState();
    controller = SwipeActionController(selectedIndexPathsChangeCallback:
        (changedIndexPaths, selected, currentCount) {
      print(
          'cell at ${changedIndexPaths.toString()} is/are ${selected ? 'selected' : 'unselected'} ,current selected count is $currentCount');

      ///I just call setState() to update simply in this example.
      ///But the whole page will be rebuilt.
      ///So when you are developing,you'd better update a little piece
      ///of UI sub tree for best performance....

      setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar :  AppBar(
        elevation: 00,
        backgroundColor: Colors.transparent,
        centerTitle: true,title: Text("Notification",style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon( Icons.arrow_back,color: Colors.black,)),),

      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _item(context, index);
        },
      ),
    );
  }

  Widget _item(BuildContext ctx, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SwipeActionCell(
        controller: controller,
        index: index,

        // Required!
        key: ValueKey(list[index]),

        /// Animation default value below
        // normalAnimationDuration: 400,
        // deleteAnimationDuration: 400,
        selectedForegroundColor: Colors.black.withAlpha(30),
        trailingActions: [
          SwipeAction(
              forceAlignmentToBoundary: false,
              backgroundRadius: 20,

              icon: Column(
                children: [
                  Icon(Icons.delete,color: Colors.white,),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('delete',style: TextStyle(fontFamily: "Montserrat Medium",color: Colors.white),),
                  ),
                ],
              ),

              //"delete",
              // performsFirstActionWithFullSwipe: true,
              // nestedAction: SwipeNestedAction(title: "confirm"),
              onTap: (handler) async {
                await handler(true);

                list.removeAt(index);
                setState(() {});
              }),
        ],

        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
              content: Text(
                'tap',
              ),
              duration: Duration(seconds: 1),
            )
            );
          },
          child:
          //Container(height: 100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black12),),
          Container(
            height: 100,
            child: Card(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text("You Have Successfully Bookde your Appointment.!",style: TextStyle(fontFamily: "Montserrat SemiBold",fontSize:12)),
                  SizedBox(height: 8,),
                  Row(children: [
                    Image.asset('assets/Image/icons/notification1.png',height: 20,),
                    Text("2 Min ago",style: TextStyle(fontFamily: "Montserrat Medium",fontSize:12,color: Colors.black54 ),),
                  ],),
                ],
              ),

            ),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.white,
              // fit: BoxFit.fill,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),

        ),
      ),
    );
  }
}