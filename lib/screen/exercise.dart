import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/classdata/class_data.dart';
import 'package:get_fit/model/modelsScreen.dart';
import 'package:lottie/lottie.dart';

import 'animation.dart';
import 'dailyWorkOut.dart';


int counter = 1;

class ExercisePage extends StatefulWidget {
  AnimationDataModel exerciseData;
  var nextIndex;
  var index;
  ExercisePage({Key key, this.exerciseData, this.nextIndex, this.index}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}
class _ExercisePageState extends State<ExercisePage> {

   Timer _timer;
  int _start = 20;

  bool isStarted = false;



  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if(_start == 0) {
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView(
          children: [
            ClipPath(
              clipper: CustomShape(),

              child: Container(
                alignment: Alignment.center,
                height: 120,
                color: Color.fromRGBO(255, 74, 133, 1),
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  horizontalTitleGap: MediaQuery.of(context).size.width /4.5,
                  leading: InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> const AnimationPage()));
                      },
                      child: Icon(Icons.arrow_back_ios,size: 15,color: Colors.white,)),
                  title: Text('Exercise' ,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.favorite_outline,size: 36,),
                ],
              ),
            ),
            Container(
              height: 200,
              child: Lottie.asset(widget.exerciseData.imageurl),
            ),
            Text(widget.exerciseData.name,textAlign: TextAlign.center,style: TextStyle(
                color: Color.fromRGBO(0, 0, 77, 1),
                fontFamily: 'sf-pro-display-cufonfonts',
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),),
            Container(
                margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                height: 1,
                color: Color.fromRGBO(123, 123, 123, 1)
            ),
            Container(
              height: 90,
              child: Center(child: Text('00:$_start',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromRGBO(0, 0, 77, 1)
              ),)),
            ),
            Container(
              height: 60,
              //color: Color.fromRGBO(255, 74, 133, 1),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: OutlinedButton(onPressed: () {
                if(isStarted == true){
                  _timer.cancel();
                  isStarted = false;
                }
                else {
                  startTimer();
                  isStarted = true;
                }
              },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 74, 133, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                  child: Text(isStarted ? 'Stop' : 'Start',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white

                  ),)),
            ),


            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ListTile(
                horizontalTitleGap: 1,
                leading:
                TextButton.icon(

                  onPressed: (){
                    if(counter >= 1){
                      print(counter--);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please go to Next Or go to Home"),
                      ));
                    }
                    setState(() {
                      print(widget.index);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ExercisePage(exerciseData: widget.nextIndex, nextIndex: itemData[counter],)));
                    });

                  },
                  icon: Icon(Icons.skip_previous_outlined,size: 30,color: Colors.black),
                  label: Text('Previous',style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),),


                ),
                title:
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),

                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> const DailyWorkoutPage()));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.black,
                              )
                          ),
                          child: Center(
                            child:Icon(Icons.home),

                          ),
                        )
                      ],
                    ),
                  ),
                ),
                trailing: TextButton.icon(
                  onPressed: (){
                    if(counter <= 5)
                    {
                      print(counter++);
                    }else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Congratulation you Have Complete this Day"),
                      ));
                    }
                    setState(() {
                      print(widget.index);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ExercisePage(exerciseData: widget.nextIndex, nextIndex: itemData[counter],)));
                    });

                    },
                  icon: Icon(Icons.skip_next,size: 30,color: Colors.black),
                  label: Text('Next',style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),),


                ),
              ),
            )
          ],
        )
    );
  }
// StartTimer(){
//   return TweenAnimationBuilder<Duration>(
//       duration: Duration(minutes: 1),
//       tween: Tween(begin: Duration(minutes: 1), end: Duration.zero),
//       onEnd: () { },
//       builder: (BuildContext context, Duration value, Widget child){
//         final minutes = value.inMinutes;
//         final seconds = value.inSeconds;
//         return Padding(
//           padding: EdgeInsets.symmetric(vertical: 5),
//           child: Text('$minutes:$seconds', textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 40,
//                 color: Color.fromRGBO(0, 0, 77, 1),
//                 fontWeight: FontWeight.bold
//             ),),
//         );
//       }
//   );
// }
}
class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 32);
    path.quadraticBezierTo(width / 2, height, width, height - 32);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
