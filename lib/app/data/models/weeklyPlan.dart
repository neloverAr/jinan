class WeeklyPlan {
  int? id;
  int? userId;
  int? semesterId;
  String? image;
  String? numberOfWeek;

  WeeklyPlan(
      {this.id, this.userId, this.semesterId, this.image, this.numberOfWeek});

  WeeklyPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    semesterId = json['semester_id'];
    image = json['image'];
    numberOfWeek = json['number_of_week'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['semester_id'] = this.semesterId;
    data['image'] = this.image;
    data['number_of_week'] = this.numberOfWeek;
    return data;
  }
}