import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/utils/extensions.dart';
import '../../../widgets/custom_divider.dart';

class StudentDataWidget extends StatelessWidget {
  const StudentDataWidget({Key? key, required this.dataType, required this.dataValue}) : super(key: key);
  final String dataType;
  final String dataValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 2.0.hp,
              horizontal: 3.0.hp),
          child: Row(
            children: [
              Text("${dataType.tr} : "),
              SizedBox(width:55.0.wp,child: Text(dataValue,
                maxLines: 2,overflow: TextOverflow.ellipsis,)),
            ],
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
