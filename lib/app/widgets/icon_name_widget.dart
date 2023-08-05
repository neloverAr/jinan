
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/constants/border_radius.dart';
import '../functions/extention.dart';

class IconNameWidget extends StatelessWidget {
  final String name;
  final String icon;
  final Function()? onTap;
  const IconNameWidget({Key? key,required this.name,required this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(cardsRadius),
        borderSide: BorderSide.none,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(cardsRadius),
        onTap: (){
          if(onTap!=null){
            onTap!();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15,vertical: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getExt(icon)=="png"?
                Image.asset(icon,height: 82,width: 83,)
                    :SvgPicture.asset(icon),
                SizedBox(height:2.0),
                Text(name,textAlign: TextAlign.center,maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
