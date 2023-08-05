
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/constants/padding.dart';
import 'package:school/app/widgets/top_widget.dart';
import '../../widgets/top_widget_title.dart';

class HomeworkScreen extends StatelessWidget {

  HomeworkScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:[
           TopWidget(
            type: "sliver",
            containedWidget:
          TopWidgetTitle(type: "withBackArrow", text: "homework".tr),),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount:6,
                      (BuildContext context,int index){
                    return Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal:mainPadding-10,
                          vertical: 5
                      ),
                      //child: HomeworkWidget(homework: assignments[index],),
                    );
                  })
          ),
        ]
      ),
    );
  }
}
