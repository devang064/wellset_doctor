import 'package:flutter/material.dart';
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(centerTitle: true,title: ( const Text("Verification",style: TextStyle(color: Colors.black))),
        backgroundColor: (Colors.transparent),
        elevation: 0.0,
        leading: IconButton(onPressed: () { Navigator.pop(context); }, icon:const Icon( Icons.arrow_back,color: Colors.black,)),),
      body: Container(),
    );
  }
}
