import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notification extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        elevation: 00,
        backgroundColor: Colors.transparent,
        centerTitle: true,title: Text("Notification",style: TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon: Icon( Icons.arrow_back,color: Colors.black,)),),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
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
            );
          },
        ),
      ),
    );
  }
}


