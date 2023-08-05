class ReviewForm {
  int? id;
  int? teacherId;
  int? reviewId;
  int? studentId;
  int? subjectId;
  String? reviewForm;
  String? review;
  String? saveVerses;
  String? linkVerses;
  String? recital;
  String? saveThePreviousDay;
  String? linkVersesThePreviousDayVerses;
  String? recitalThePreviousDay;
  String? reviewFromThree;
  String? amount;
  String? mealContent;
  String? notes;

  ReviewForm(
      {this.id,
        this.teacherId,
        this.reviewId,
        this.studentId,
        this.subjectId,
        this.reviewForm,
        this.review,
        this.saveVerses,
        this.linkVerses,
        this.recital,
        this.saveThePreviousDay,
        this.linkVersesThePreviousDayVerses,
        this.recitalThePreviousDay,
        this.reviewFromThree,
        this.amount,
        this.mealContent,
        this.notes});

  ReviewForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    reviewId = json['review_id'];
    studentId = json['student_id'];
    subjectId = json['subject_id'];
    reviewForm = json['review_form'];
    review = json['review'];
    saveVerses = json['save_verses'];
    linkVerses = json['link_verses'];
    recital = json['recital'];
    saveThePreviousDay = json['save_the_previous_day'];
    linkVersesThePreviousDayVerses =
    json['link_verses_the_previous_day_verses'];
    recitalThePreviousDay = json['recital_the_previous_day'];
    reviewFromThree = json['review_from_three'];
    amount = json['amount'];
    mealContent = json['meal_content'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacher_id'] = this.teacherId;
    data['review_id'] = this.reviewId;
    data['student_id'] = this.studentId;
    data['subject_id'] = this.subjectId;
    data['review_form'] = this.reviewForm;
    data['review'] = this.review;
    data['save_verses'] = this.saveVerses;
    data['link_verses'] = this.linkVerses;
    data['recital'] = this.recital;
    data['save_the_previous_day'] = this.saveThePreviousDay;
    data['link_verses_the_previous_day_verses'] =
        this.linkVersesThePreviousDayVerses;
    data['recital_the_previous_day'] = this.recitalThePreviousDay;
    data['review_from_three'] = this.reviewFromThree;
    data['amount'] = this.amount;
    data['meal_content'] = this.mealContent;
    data['notes'] = this.notes;
    return data;
  }
}