import 'reasonForEvaluation.dart';

class StudentPoint {
  int? totalPoints;
  ReasonsForEvaluation? reasonsForEvaluation;

  StudentPoint({this.totalPoints, this.reasonsForEvaluation});

  StudentPoint.fromJson(Map<String, dynamic> json) {
    totalPoints = json['total_points'];
    reasonsForEvaluation = json['reasons_for_evaluation'] != null
        ? ReasonsForEvaluation.fromJson(json['reasons_for_evaluation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_points'] = totalPoints;
    if (reasonsForEvaluation != null) {
      data['reasons_for_evaluation'] = reasonsForEvaluation!.toJson();
    }
    return data;
  }
}