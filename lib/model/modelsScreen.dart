
import 'package:flutter/material.dart';
import 'package:get_fit/classdata/class_data.dart';


//AllDataModel
final List<String>
name_item  = [
  'JUMPING JACKS',
  'Single Leg Hip Rotation',
  'Staggered_push_ups',
  'Squat Reach',
  'Punches',
  'Seated abs circles',
  'JUMPING JACKS',
  'Single Leg Hip Rotation',
  'Staggered_push_ups',
  'Squat Reach',
  'Punches',
  'Seated abs circles',
];
List<String> time_item= [
  '00.20',
  'x16',
  'x10',
  'x12',
  'x20',
  'x5',
  '00.20',
  'x16',
  'x10',
  'x12',
  'x20',
  'x5',
];
List imageurl = [
  'assets/jump1.json',
  'assets/2.json',
  'assets/3.json',
  'assets/4.json',
  'assets/5.json',
  'assets/6.json',
  'assets/7.json',
  'assets/3.json',
  'assets/4.json',
  'assets/5.json',
  'assets/6.json',
  'assets/7.json',

];

final List<AnimationDataModel> itemData = List.generate(
    name_item.length,
        (index) => AnimationDataModel( name: name_item[index], imageurl: imageurl[index],time:time_item[index],
    )
);



//GredviewModel
List<String> per_item= [
  '0%', '0%', '0%', '0%', '0%', '0%', '0%', '0%', '0%', '0%',
  '0%', '0%', '0%', '0%', '0%', '0%', '0%', '0%', '0%', '0%',
  '0%', '0%', '0%', '0%', '0%', '0%', '0%', '0%', '0%', '0%',
];
List<String> days_item= [
  'Day 1','Day 2', 'Day 3','Day 4', 'Day 5', 'Day 6',
  'Day 7', 'Day 8', 'Day 9', 'Day 10', 'Day 11', 'Day 12',
  'Day 13', 'Day 14', 'Day 15', 'Day 16', 'Day 17', 'Day 18',
  'Day 19', 'Day 20', 'Day 21', 'Day 22', 'Day 23', 'Day 24',
  'Day 25', 'Day 26', 'Day 27', 'Day 28', 'Day 29', 'Day 30',

];

final List<GredviewModel>  gredData = List.generate(days_item.length,
        (index) => GredviewModel('${days_item[index]}', '${per_item[index]}'));


//Carasouldata model
final List<String>
tipsName  = [
  'A Tips',
  'B Tips',
  'C Tips',
  'D Tips',
  'E Tips',
  'F Tips',


];

final List<String>
tipsDescription  = [

  'a  description',
  'b description',
  'c description',
  'd description',
  'e description',
  'f description',
];


Map<int, Color> colorList = {
  1 : Colors.red,
  2 : Colors.orange,
  3 : Colors.green,
};

final List<Carasouldata> carasoulList = List.generate(tipsName.length, (index) => Carasouldata(
    tips: tipsName[index], description: tipsDescription[index], color: colorList[index]
));
