import 'package:flutter/material.dart';
class EmailAdd extends StatefulWidget {
  const EmailAdd({Key? key}) : super(key: key);

  @override
  State<EmailAdd> createState() => _EmailAddState();
}

class _EmailAddState extends State<EmailAdd> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (Text("Add Email Address", style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),)),
        backgroundColor: (Colors.transparent),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                  context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body:
      SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Padding(padding: const EdgeInsets.only(left:16 ,right:16 ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 54,),
              Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:const [
                  Text("Enter",style: TextStyle(fontSize: 28,fontFamily: "Montserrat "),),
                  Text("Email Address",style: TextStyle(fontSize: 28,fontFamily: "Montserrat "),),
                ],  ),
              const SizedBox(height: 7,),
              const Text('To Add Email You Need To Enter Your Email Below.',style: TextStyle(fontSize: 15,color: Colors.black26,fontFamily: "Montserrat"),textAlign: TextAlign.start,),
              const SizedBox(
                height: 35.47,
              ),
              const Text("Email Address",style:  TextStyle(fontSize:18,color: Colors.black12,fontFamily: "Montserrat" ,),),
              SizedBox(height: 10,),
              TextFormField(
                keyboardType: TextInputType.phone,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: " Enter your Email Address",
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),),
              // const SizedBox(height: 49,
              //   child: TextField(
              //       keyboardType: TextInputType.number,
              //       textAlign: TextAlign.start
              //   ),
              // ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  Expanded(
                    child:
                    FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                title: Center(
                                  child: InkWell(onTap: (){
                                    Navigator.pop(context);
                                     Navigator.pop(context);
                                    // Navigator.pop(context);
                                  },
                                    splashColor: Colors.transparent,highlightColor: Colors.transparent,
                                    child: Column(
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset('assets/Image/Group 16820.jpg',
                                              width: 50, height: 50, fit: BoxFit.contain,),
                                          ),
                                          const Text('Verification Link Has Been Sent Successfully',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat SemiBold'),),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Please click on the link that has been sent to your Email '
                                                'Address to verify your Email.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color:Colors.black26 ,fontSize: 12,fontFamily: 'Montserrat Medium'),),
                                          ),

                                        ]
                                    ),
                                  ),
                                ),
                                //  title: Text("Verification Code"),

                              );

                            }
                        );
                      }, height: 49,
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius. circular(10)),
                      child: const Text("Submit",style: TextStyle(color: Colors.white,fontFamily: "Montserrat SemiBold")),
                    ),

                  ),
                ],
              ),

            ],
          ),
        ),
      ),

    );;
  }
}
