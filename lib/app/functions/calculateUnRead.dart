
import '../data/models/notification.dart';

int calculateUnRead(List<NotificationModel> list){
  int count = 0;
  list.forEach((element) {
    if(element.read=="false"){
      ++count;
    }
  });
  return count;
}