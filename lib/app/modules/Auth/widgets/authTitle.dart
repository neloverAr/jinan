
import 'package:flutter/material.dart';
import 'package:school/app/core/constants/padding.dart';

class AuthTitle extends StatelessWidget {
  final title;
  const AuthTitle({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: authTitlePadding),
      child: Text(title,style:Theme.of(context).textTheme.headline1
      ),
    );
  }
}
