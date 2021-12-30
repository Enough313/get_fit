import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/model/modelsScreen.dart';
import 'package:get_fit/screen/tipspage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dailyWorkOut.dart';
import 'daitpage.dart';
import 'exercise.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int activeState = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(

            appBar: AppBar(
              leading: new Icon(Icons.menu,color: Colors.green,),

              elevation: 0.0,
              toolbarHeight: 35,
              backgroundColor:
              Colors.white,
              //Color(0xffFF4A85).withOpacity(0.7),
              title: Container(
                margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Get Fit',
                        style: TextStyle(fontSize: 25,color: Colors.black,
                         fontFamily: 'Roboto',
                        ),),
                      //Icon(Icons.notification_important_rounded,color: Colors.white,)
                    ],
                  )),


              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(0),
                ),
              ),
              bottom: const TabBar(
                indicatorColor: Colors.transparent,
                tabs: [
                  Tab(icon: Icon(Icons.list,color: Colors.black, )),
                  Tab(icon: Icon(Icons.border_all,color: Colors.black)),
                ],
              ),

            ),

          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[

                const DrawerHeader(
                  child: Text(''),
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      image: DecorationImage(
                          image: AssetImage("images/drawer_pic.png"),
                          fit: BoxFit.cover)
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.notification_important, color:  Colors.amber,), title: Text("Tips"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                Divider(
                  height: 6,

                ),
                ListTile(
                  leading: Icon(Icons.home), title: Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.contacts), title: Text("Contact Us"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.settings), title: Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings), title: Text("Terms & Conditions"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.error), title: Text("Privicy"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),


              ],
            ),
          ),

          body: TabBarView(

            children: [




              //Container for list view
              ListView(
                children: [


                  // Code for carousel slider
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    // color: Colors.orange,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          autoPlay: true),
                      items: carasoulList.map((e)  => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                             color: e.color,
                              child: Column(
                                children: [
                                  Text(e.tips, style: const TextStyle(color:Colors.black38),),
                                  Text(e.description, style: const TextStyle(color:Colors.black26),),
                                ],
                              ),
                            )

                            // Image.asset(
                            //   e,
                            //   width: MediaQuery.of(context).size.width,
                            //   height: 180,
                            //   fit: BoxFit.fitWidth,
                            //   // fit: BoxFit.cover,
                            // )
                          ],
                        ),
                      )).toList(),
                    ),
                  ),

                  //code for workout in listview
                  InkWell(
                    onTap: (){
                      print('this is listview');
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> const DailyWorkoutPage()));
                    },
                    child: Container(
                      height: 80,
                      width: 90,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration:  const BoxDecoration(
                        //color: Colors.blue,
                       //   border: Border.all(),
                         // borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //container for img workout
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 80,
                            width: 80,
                            decoration:  BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage('images/workout_pic.png'),
                                    fit: BoxFit.cover,opacity: 0.9)
                            ),
                          ),

                          // column for text
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: const [
                                Text('WorkOuts',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,
                                   fontFamily: 'sf-pro-display-cufonfonts',
                                  ),),
                                Text('Routine and Traninig programs',
                                  style: TextStyle(fontSize: 12, fontFamily: 'sf-pro-display-cufonfonts',),),
                              ],
                            ),
                          ),

                          Icon(Icons.keyboard_arrow_right),

                        ],
                      ),
                    ),
                  ),



                  //code for exercise in listview

                  InkWell(
                    onTap: (){
                      print('this is listview');
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> const DailyWorkoutPage ()));
                    },
                    child: Container(
                      height: 80,
                      width: 90,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration:  const BoxDecoration(
                        //color: Colors.blue,
                        //   border: Border.all(),
                        // borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //container for img workout
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 80,
                            width: 80,
                            decoration:  BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage('images/exercise_pic.png'),
                                    fit: BoxFit.cover,opacity: 0.9)
                            ),
                          ),

                          // column for text
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: const [
                                Text('Exercises',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,
                                    fontFamily: 'sf-pro-display-cufonfonts',),),
                                Text('Parenting vidios',
                                  style: TextStyle(fontSize: 12,
                                   fontFamily: 'sf-pro-display-cufonfonts',
                                  ),),
                              ],
                            ),
                          ),

                          Icon(Icons.keyboard_arrow_right),

                        ],
                      ),
                    ),
                  ),


                  //code for dait food in listview
                  InkWell(
                    onTap: (){
                      print('this is listview');
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> const DaitPage()));
                    },
                    child: Container(
                      height: 80,
                      width: 90,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration:  const BoxDecoration(
                        //color: Colors.blue,
                        //   border: Border.all(),
                        // borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //container for img workout
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 80,
                            width: 80,
                            decoration:  BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage('images/dietfood_pic.png'),
                                    fit: BoxFit.cover,opacity: 0.9)
                            ),
                          ),

                          // column for text
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: const [
                                Text('Dietfood',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,
                                    fontFamily: 'sf-pro-display-cufonfonts',),),
                                Text('Personalized food plans',
                                  style: TextStyle(fontSize: 12, fontFamily: 'sf-pro-display-cufonfonts',),),
                              ],
                            ),
                          ),

                          Icon(Icons.keyboard_arrow_right),

                        ],
                      ),
                    ),
                  ),


                //code for tips in listview
                  InkWell(
                    onTap: (){
                      print('this is listview');
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> const TipsPage ()));
                    },
                    child: Container(
                      height: 80,
                      width: 90,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration:  const BoxDecoration(
                        //color: Colors.blue,
                        //   border: Border.all(),
                        // borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //container for img workout
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 80,
                            width: 80,
                            decoration:  BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage('images/quick_tips.png'),
                                    fit: BoxFit.cover,opacity: 0.9)
                            ),
                          ),

                          // column for text
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: const [
                                Text('Tips',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,
                                    fontFamily: 'sf-pro-display-cufonfonts',),),
                                Text('Quick Tips for Daiting',
                                  style: TextStyle(fontSize: 12, fontFamily: 'sf-pro-display-cufonfonts',),),
                              ],
                            ),
                          ),

                          Icon(Icons.keyboard_arrow_right),

                        ],
                      ),
                    ),
                  ),

                ],
              ),


              //Container for Gridview
              ListView(
                children: [

                  // Code for carousel slider
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    // color: Colors.orange,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          autoPlay: true),
                      items: carasoulList.map((e)  => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              color: e.color,
                              child: Column(
                                children: [
                                  Text(e.tips, style: const TextStyle(color:Colors.black38),),
                                  Text(e.description, style: const TextStyle(color:Colors.black26),),
                                ],
                              ),
                            )

                            // Image.asset(
                            //   e,
                            //   width: MediaQuery.of(context).size.width,
                            //   height: 180,
                            //   fit: BoxFit.fitWidth,
                            //   // fit: BoxFit.cover,
                            // )
                          ],
                        ),
                      )).toList(),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      height: 400,
                      width: 400,
                      child:GridView.count(
                          crossAxisCount: 2,
                        children: [

                          //code for workout in gridview
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 70,
                            width: 30,
                            decoration:  BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage('images/workout_pic.png'),
                                    fit: BoxFit.cover,opacity: 0.9)
                            ),
                            child: InkWell(
                              onTap: (){
                                print('this is listview');
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> const DailyWorkoutPage()));
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: Column(
                                  children: const [
                                    Text('WorkOuts',
                                      style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.white,fontSize: 16),),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text('Routine and Traninig programs',
                                        style: TextStyle(fontSize: 13,color: Colors.white),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          //code for exercise in gridview
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 70,
                            width: 30,
                            decoration:  BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage('images/exercise_pic.png'),
                                    fit: BoxFit.cover,opacity: 0.9)
                            ),
                            child: InkWell(
                              onTap: (){
                                print('this is listview');
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> const DailyWorkoutPage()));
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: Column(
                                  children: const [
                                    Text('Exercises',
                                      style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.white,fontSize: 16),),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text('Parenting vidios',
                                        style: TextStyle(fontSize: 13,color: Colors.white),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                          //code for dait food in gridview
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 70,
                            width: 30,
                            decoration:  BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage('images/dietfood_pic.png'),
                                    fit: BoxFit.cover,opacity: 0.9)
                            ),
                            child: InkWell(
                              onTap: (){
                                print('this is listview');
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> const DaitPage()));
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: Column(
                                  children: const [
                                    Text('Dietfood',
                                      style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.white,fontSize: 16),),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text('Personalized food plans',
                                        style: TextStyle(fontSize: 13,color: Colors.white),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          //code for tips in gridview
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            height: 70,
                            width: 30,
                            decoration:  BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage('images/quick_tips.png'),
                                    fit: BoxFit.cover,opacity: 0.9)
                            ),
                            child: InkWell(
                              onTap: (){
                                print('this is listview');
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> const TipsPage()));
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: Column(
                                  children: const [
                                    Text('',
                                      style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.white,fontSize: 16),),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text('',
                                        style: TextStyle(fontSize: 13,color: Colors.white),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                        ],
                      )
                    ),
                  ),

                ],
              ),

            ],
          ),


            // Bottom Navigation Bar
            // bottomNavigationBar: BottomNavigationBar(
            //
            //   type: BottomNavigationBarType.fixed, // This is all you need!
            //   backgroundColor: Color(0xffF2F4F3),
            //   selectedItemColor: Color(0xff022C43),
            //   unselectedItemColor: Colors.grey.withOpacity(.60),
            //   selectedFontSize: 14,
            //   unselectedFontSize: 14,
            //   onTap: (value) {
            //     // Respond to item press.
            //   },
            //   items: const [
            //     BottomNavigationBarItem(
            //       label: ('Home'),
            //       icon: Icon(Icons.home),
            //     ),
            //     BottomNavigationBarItem(
            //       label: ('Favorite'),
            //       icon: Icon(Icons.favorite),
            //     ),
            //     BottomNavigationBarItem(
            //       label: ('Settings'),
            //       icon: Icon(Icons.settings),
            //     ),
            //
            //   ],
            // )
        ),
      ),
    );
  }
}







