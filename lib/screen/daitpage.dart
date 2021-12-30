import 'package:flutter/material.dart';
class DaitPage extends StatefulWidget {
  const DaitPage({Key key}) : super(key: key);

  @override
  _DaitPageState createState() => _DaitPageState();
}

class _DaitPageState extends State<DaitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        //  toolbarHeight: 60,
          backgroundColor:
          //Colors.blue,
          Color(0xffFF4A85).withOpacity(0.7),
          title: Container(
              margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: const Text('Get Fit',
                style: TextStyle(color: Colors.white,fontSize: 25),)
          ),

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0),
            ),
          ),

        ),
      body:ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: 200,
            width: 30,
            decoration:  BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
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
        ],
      )
    );
  }
}
