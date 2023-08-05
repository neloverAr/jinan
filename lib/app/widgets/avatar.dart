import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core/values/images_path.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 50,
        child: SizedBox(
        width: 94,
        height: 94,
        child: ClipOval(
        child: CachedNetworkImage(imageUrl: image,fit: BoxFit.fill,
       // placeholder: (context, url) => const Loading(),
        errorWidget: (context, url, error)=> Center(child: Image.asset(unknownImage,fit: BoxFit.fill,)),
        //errorWidget: ,
        ),
        // Image.network(,
        //   errorBuilder: (context, error, stackTrace){
        //   return ;
        // },),
    )
    ));
  }
}
