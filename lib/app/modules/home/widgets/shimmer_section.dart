
import 'package:flutter/material.dart';
import 'package:school/app/core/utils/extensions.dart';
import '../../../core/constants/padding.dart';

class ShimmerSection extends StatelessWidget {
  const ShimmerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal:mainPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10,
            width: 30.0.wp,
            decoration:  BoxDecoration(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 1.0.hp,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(height: 14.0.hp,decoration:  BoxDecoration(
                  color: Colors.black,
                ),),
              ),
              SizedBox(width: 2.0.wp,),
              Expanded(
                flex: 1,
                child: Container(height: 14.0.hp,decoration:  BoxDecoration(
                  color: Colors.black,
                ),),
              ),
            ],
          )

        ],
      ),
    );
  }
}
