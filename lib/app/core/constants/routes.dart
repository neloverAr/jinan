
class AppRoute{
  //static const String baseURL = "https://jenan.portalshub.com/api/v1/";
  static const String baseURL = "https://app-rawdaljinan.com/api/v1/";
  static const String baseURLPure = "https://app-rawdaljinan.com";

  //Auth
  static const String login = "${baseURL}login";
  static const String changePassword = "${baseURL}change-password";
  static const String forgetPassword = "${baseURL}password/forget";
  static const String resetPassword = "${baseURL}password/reset";
  static const String editPassword = "${baseURL}change-password";
  static const String sons = "${baseURL}sons";
  static const String parentsHomepage = "${baseURL}parents-home-screen/";
  static const String sonSubjects = "${baseURL}son-subjects/";
  static const String sonSubjectsDetails = "${baseURL}son-subject/";
  static const String schoolSchedules = "${baseURL}school-schedules/";
  static const String sendMessage = "${baseURL}send-message/";
  static const String appInformation = "${baseURL}app-information/";
  static const String showAppInformation = "${baseURL}show-app-information/";
  static const String studentFile = "${baseURL}student-file/";
  static const String profile = "${baseURL}profile";
  static const String settings = "${baseURL}settings";
  static const String updateProfile = "${baseURL}update/profile";
  static const String studentReviews = "${baseURL}student-reviews/";
  static const String studentTeachers = "${baseURL}student-teachers/";
  static const String allPoints = "${baseURL}all-points/";
  static const String subjectAdditionalDetail = "${baseURL}subject-additional-detail/";
  static const String addSubjectAdditionalDetail = "${baseURL}add-subject-additional-detail/";
  static const String addSubjectReview = "${baseURL}add-subject-review/";
  static const String parentSubjectReview = "${baseURL}parent-subject-reviews/";
  static const String subjectReview = "${baseURL}student-subject-reviews/";
  static const String subjectChapterReview = "${baseURL}student_chapter_reviews/";
  static const String attendances = "${baseURL}student-attendances/";

  static const String teacherHomeScreen = "${baseURL}home-screen";
  static const String teacherSemesters = "${baseURL}teacher-semesters";
  static const String teacherSubjects = "${baseURL}teacher-subjects";
  static const String teacherStudents = "${baseURL}teacher-students";
  static const String teacherParents = "${baseURL}teacher-parents";
  static const String teacherChapters = "${baseURL}teacher-subject-chapter/";
  static const String honorBoard = "${baseURL}honorary-board";
  static const String weeklyPlan = "${baseURL}weekly-plan/";
  static const String chat = "${baseURL}all-chats";

  static const String showChat = "${baseURL}show-chat/";
  static const String showNotification = "${baseURL}get-notifications";
  static const String readNotification = "${baseURL}read-notifications";
  static const String addAttendances = "${baseURL}add-attendances/";
  static const String addPoints = "${baseURL}add-student-points/";
  static const String teacherSemesterStudents = "${baseURL}teacher-semester-students/";
  static const String reasonsForEvaluation = "${baseURL}reasons-for-evaluation?type=points";

}