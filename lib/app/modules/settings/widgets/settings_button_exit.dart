
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import 'package:school/app/core/values/colors.dart';

import '../../../core/values/icons.dart';

class SettingsButtonExit extends StatelessWidget {
  final String text;
  final String icon;
  final Function() onPressed;

  const SettingsButtonExit({
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize:10.0.sp),
              ),
              InkWell(
                  onTap: () {
                    _showDialog(context);
                  },
                  child: SvgPicture.asset(infoIcon,color: Colors.orange,)),

            ],
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text("exitButton".tr),
        content: Text("exitButtonInfo".tr,textAlign: TextAlign.justify,),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  primary: red
              ),
              child: Text("ok".tr)
          ),
        ],
      );
    },
  );
}
