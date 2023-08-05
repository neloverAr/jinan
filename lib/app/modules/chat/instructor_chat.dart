
import 'package:flutter/material.dart';
import 'package:school/app/data/models/message.dart';
import 'package:school/app/widgets/top_widget.dart';
import 'package:school/app/widgets/top_widget_title.dart';

class InstructorChat extends StatelessWidget {
  final Message message;
  const InstructorChat({Key? key,required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: CustomScrollView(
       slivers: [
         TopWidget(type: "sliver", containedWidget: TopWidgetTitle(
           text: "",type: "withArrowBack",
         ))
       ],
     ),
    );
  }
}
