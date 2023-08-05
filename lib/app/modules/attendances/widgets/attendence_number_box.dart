
import 'package:flutter/material.dart';
import 'package:school/app/core/constants/border_radius.dart';

class AttendanceNumBox extends StatelessWidget {
  final String text;
  final int count;
  final Color color;
  AttendanceNumBox({Key? key,required this.text, required this.count,
    required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardsRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(cardsRadius),
        onTap: (){
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: Center(
            child: Column(
              children: [
                Text(text),
                SizedBox(height: 6,),
                Text("$count",style: TextStyle(color: color),)
              ],
            ),
          )
        ),
      ),
    );
  }

}
