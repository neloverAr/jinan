

import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import '../data/services/storage/services.dart';

StorageService storageService = Get.find();
String getDate(String date){
  //DateTime s = DateTime.parse(date);

  DateTime postTime = DateTime.parse(date); // post time
  DateTime now = DateTime.now(); // current time
  Duration difference = now.difference(postTime); // difference between post time and current time
  int minutes = difference.inMinutes; // convert the difference to minutes
  int hours = difference.inHours; // convert the difference to hours
  int days = difference.inDays; // convert the difference to days

  if (minutes < 60) {
    if(storageService.read("lang")=="en"){
      return '$minutes minutes ago';
    }else{
      return '$minutesدقيقة ';
    }

  } else if (hours < 24) {
    if(storageService.read("lang")=="en"){
      return '$hours hours ago';
    }else{
      return '$hoursساعة ';
    }

  } else {
    if(storageService.read("lang")=="en"){
      return '$days days ago';
    }else{
      return '$days يوم ';
    }
  }

  //return formatDate(s, [yyyy, '/', mm, '/', dd]);
}

//
String getDate2(String date){

  DateTime postTime = DateTime.parse(date); // post time
  DateTime now = DateTime.now(); // current time
  Duration difference = now.difference(postTime); // difference between post time and current time
  int days = difference.inDays;

  if(days==1){
    if(storageService.read("lang")=="en"){
      return 'Tomorrow';
    }else{
      return 'غدا';
    }
  }else{
    return formatDate(postTime, [yyyy, '/', mm, '/', dd]);
  }

}

//Date in String format
String getDate3(String date){
  if(date==""){
    return date;
  }
  DateTime postTime = DateTime.parse(date); // post time
  return formatDate(postTime, [yyyy, '/', mm, '/', dd]);
}

//Date in DateTime format
DateTime getDate4(String date){

  DateTime postTime = DateTime.parse(date); // post time
  return postTime;
}