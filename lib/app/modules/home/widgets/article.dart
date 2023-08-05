import 'package:flutter/material.dart';

import '../../../core/values/colors.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    required this.img,
    required this.text1,
    required this.text2,
    Key? key,
  }) : super(key: key);

  final img;
  final text1;
  final text2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height:144,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: AssetImage(img,),
                  fit:BoxFit.cover
              )
          ),
        ),
        Container(
          height:144,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  red.withOpacity(.7),
                  Colors.white.withOpacity(.3),
                ]

            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(text1,style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: 5,),
                  Text(text2,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}