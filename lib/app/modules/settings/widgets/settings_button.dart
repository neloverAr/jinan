
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/app/core/utils/extensions.dart';

class SettingsButton extends StatelessWidget {
  final String text;
  final String icon;
  final Function() onPressed;

  const SettingsButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.3.hp,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextButton.icon(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              minimumSize:Size(double.infinity, 1.0.hp)),
          icon: SvgPicture.asset(icon),
          label: Row(
            children: [
              Text(text,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize:10.0.sp),
              ),//10.0.sp
            ],
          ),
        ),
      ),
    );
  }
}
