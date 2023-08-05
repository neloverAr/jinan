
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school/app/core/values/icons.dart';
import 'package:school/app/modules/home/student/home_controller.dart';
import '../../../core/values/colors.dart';
import '../../../data/services/storage/services.dart';

class SearchField extends StatelessWidget {
   SearchField({Key? key}) : super(key: key);
  HomeController homeController = Get.find();
   StorageService storageService = Get.find();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: homeController.searchText,
      autofocus: false,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.white,
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.white,
              )
          ),
          hintText: "searchBySubject".tr,
          hintStyle: TextStyle(
            color: Color(0xFF2F2F2F).withOpacity(0.25),
          ),
          prefixIcon:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  searchIcon,
                  height:16 ,
                  width: 16,
                  color: Color(0xFF292D32).withOpacity(0.25),
              ),
            ),
          suffixIcon: InkWell(
            onTap: (){
                homeController.searchSubjects(homeController.searchText.text);
              homeController.searchText.text="";
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 42,
                  width: 42,
                  decoration:BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                        filterIcon,
                        color: Colors.white,
                    ),
                  ),),
            ),
          )
      ),
    );
  }
}
