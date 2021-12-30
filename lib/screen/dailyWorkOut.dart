import 'package:flutter/material.dart';
import 'package:get_fit/model/modelsScreen.dart';

import 'animation.dart';



class DailyWorkoutPage extends StatefulWidget {

  const DailyWorkoutPage({Key key}) : super(key: key);

  @override
  _DailyWorkoutPageState createState() => _DailyWorkoutPageState();
}
class _DailyWorkoutPageState extends State<DailyWorkoutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Fit A 30 Days"),
      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            SizedBox(
             height: 700,
              width: double.infinity,
              child: Expanded(
                child: GridView.builder(
                  itemCount: days_item.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0
                  ),
                  itemBuilder: (BuildContext context, int index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> const AnimationPage()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                  blurRadius: 30,
                                  offset: Offset(3,3),
                                  color: Colors.black.withOpacity(0.4)),]
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(
                                              color: Colors.red,
                                            )
                                        ),
                                        child: Center(
                                          child: Text( gredData[index].per,style:
                                          const TextStyle(fontSize: 13,fontWeight: FontWeight.bold,
                                              fontFamily: 'Roboto'
                                          ),),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        gredData[index].days,style:
                                      TextStyle(fontSize: 13,fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto',
                                      ),
                                      ),
                                    ],
                                  ),

                                ),
                              ],
                            ),
                          )
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
