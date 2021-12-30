import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/model/modelsScreen.dart';


import 'package:lottie/lottie.dart';


import 'exercise.dart';



class AnimationPage extends StatefulWidget {
  const AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    boxShadow: [BoxShadow(
                        blurRadius: 30,
                        offset: Offset(3,3),
                        color: Colors.black.withOpacity(0.4)),]
                ),
                child: Lottie.asset('assets/7.json'),

              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,

                    boxShadow: [BoxShadow(
                        blurRadius: 30,
                        offset: Offset(3,3),
                        color: Colors.black.withOpacity(0.4)),]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,top: 15),
                  child: Text(
                    "10 mins. 11 workouts",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                        fontSize: 15
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  child:  SizedBox(height: 390, width: double.infinity,
                    child:
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: name_item.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                ),
                                child: Card(
                                  //  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExercisePage( exerciseData:itemData[index], index: index + 1, nextIndex: itemData[index + 1],)));
                                            // SnackBar snackBar =
                                            // SnackBar(content: Text("Tapped : ${index + 1}"));
                                            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          },
                                          leading: const Padding(
                                            padding: EdgeInsets.only(top: 6),
                                            child: Icon(
                                              Icons.menu,
                                            ),
                                          ),
                                          title: Row(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: SizedBox(
                                                  height: 70,
                                                  width: 70,
                                                  child: Lottie.asset(itemData[index].imageurl),

                                                ),

                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      itemData[index].name,style: TextStyle(fontSize: 15,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      itemData[index].time,style: TextStyle(fontSize: 12,
                                                        color: Colors.grey
                                                    ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  // height: 520,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
