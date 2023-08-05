
import 'package:flutter/material.dart';

class StudentAvatar extends StatelessWidget {
  final avatar;
  final radius;
  const StudentAvatar({Key? key,required this.avatar,this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = this.radius??53.0;
    return CircleAvatar(
        radius:radius,
        backgroundColor:Color(0xFFF8F8F8),
        child: CircleAvatar(
          backgroundColor:Color(0xFFF8F8F8),
          radius: radius-4,
          backgroundImage: AssetImage(avatar),
        )
    );
  }
}
