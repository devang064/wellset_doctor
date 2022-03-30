import 'package:flutter/material.dart';
class Faqs extends StatefulWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,
        centerTitle: true,
        title: Text("FAQ's",style: TextStyle(fontFamily: 'Montserrat SemiBold',color: Colors.black),),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Image.asset('assets/Image/icons/menu2.png'),),),
      body: SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [ListView.builder( shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                itemCount: it.length,
                itemBuilder: (BuildContext ctx, i) {
                  return
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: DecoratedBox(
                  decoration: BoxDecoration(
                        //background color of dropdown button
                        border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                        borderRadius: BorderRadius.circular(16), //border raiuds of dropdown button

                  ),

                  child:
                  Padding(
                      //padding: EdgeInsets.all(1),
                        padding: EdgeInsets.only(left:10, right:10,),
                        child:DropdownButton(
                          value: it[i].Title,
                          items: [ //add items in the dropdown
                            DropdownMenuItem(
                              child: Text(it[i].Title),
                              value: it[i].Title,
                            ),
                            DropdownMenuItem(
                                child: Text(it[i].item1),
                                value: it[i].item1
                            ),
                            DropdownMenuItem(
                              child: Text(it[i].item2),
                              value: it[i].item2,
                            )

                          ],
                          onChanged: (value){ //get value when changed
                            print("You have selected $value");
                          },
                          icon: Padding( //Icon at tail, arrow bottom is default icon
                              padding: EdgeInsets.only(left:20),
                              child:Icon(Icons.keyboard_arrow_down)
                          ),
                          iconEnabledColor: Colors.black, //Icon color
                          style: TextStyle(  fontFamily: "Montserrat Medium",//te
                              color: Colors.black, //Font color
                              fontSize: 16 //font size on dropdown button
                          ),
                        borderRadius: BorderRadius.circular(20),
                          dropdownColor: Colors.white, //dropdown background color
                          underline: Container(), //remove underline
                          isExpanded: true, //make true to make width 100%
                        )
                  )
              ),
                    );})
            ],
          ),
        ),
      ),
    );
  }
}
class droplist {
  const droplist( { required this.Title,required this.item1,required this.item2,});

  final String Title;
  final String item1;
  final String item2;

}

const List<droplist> it = <droplist>[
 droplist(Title: 'Service We Offer', item1: '1', item2: '2'),
  droplist(Title: 'How To Change Mobile Number', item1: '1', item2: '2'),
  droplist(Title: 'What Are The Payment Option', item1: '1', item2: '2'),
  droplist(Title: 'Lorem ipsom dolor simit', item1: '1', item2: '2'),
  droplist(Title: 'How To Change Mobile Number', item1: '1', item2: '2'),

];