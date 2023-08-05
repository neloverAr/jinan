
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/app/core/utils/extensions.dart';
import '../../../../core/constants/border_radius.dart';
import '../../../../core/values/icons.dart';

class AuthDropDawn extends StatelessWidget {
  final List<String> items;
  final dropDawnValue;
  final Function(String?) onChanged;
  final labelText;
  const AuthDropDawn({Key? key,required this.items,required this.dropDawnValue,required this.onChanged,required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText,
            style: TextStyle(
            fontSize: 12.0.sp,
          ),),
         const SizedBox(height: 17.0,),
          DropdownButtonFormField<String>(
            value: dropDawnValue,
            isExpanded: true,
              itemHeight:48,
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xEEEEEEEE),
                  ),),
              border: OutlineInputBorder(),
            ),
            elevation: 0,
            borderRadius: BorderRadius.circular(textFieldRadius),
            icon: SvgPicture.asset(arrowIcon),
            items: items.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
