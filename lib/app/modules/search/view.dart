import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/app/core/values/colors.dart';
import 'package:school/app/functions/checkLanguage.dart';
import '../../data/services/storage/services.dart';

class SearchingList extends StatelessWidget {
  final List items;
  final String query;
  SearchingList({ Key? key, required this.items, required this.query}) : super(key: key);
  StorageService storageService = Get.find();
  @override
  Widget build(BuildContext context) {
    final title = '${"searchingResultsFor".tr} ( $query )';

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: red,
          automaticallyImplyLeading:true,

        ),
        body: items.length==0?Center(child: Text("noResults".tr),):
        ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap:(){
                if(storageService.read("type")=="parents"){
                  Get.toNamed("/subject-details",arguments: {
                    "subjectID":items[index].id
                  });
                }else{
                  Get.toNamed("/teacher-subject-details",arguments: {
                    "subjectID":items[index].subjectId,
                    "subjectEnglishName":items[index].enName,
                    "subjectArabicName":items[index].arName,
                  });
                }
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text(storageService.read("type")=="parents"?'${items[index].name}'
                    :(isArLang()?'${items[index].arName}':'${items[index].enName}')
                    ),
                  ),
                  Divider(),
                ],
              ),
            );
          },
        ),
      );
  }
}