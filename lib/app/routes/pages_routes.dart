import 'package:get/get.dart';
import 'package:school/app/middleware/myMiddleware.dart';
import 'package:school/app/modules/add_points/view.dart';
import 'package:school/app/modules/chat/start_new_conversation/view.dart';
import 'package:school/app/modules/chat/view.dart';
import 'package:school/app/modules/home/student/event_description/view.dart';
import 'package:school/app/modules/home/teacher/view.dart';
import 'package:school/app/modules/notifications/view.dart';
import 'package:school/app/modules/parent_child_selection/view.dart';
import 'package:school/app/modules/settings/profile_edit/view.dart';
import 'package:school/app/modules/students/view.dart';
import 'package:school/app/modules/subject_review/teacher/add_interactive_periods/view.dart';
import 'package:school/app/modules/subject_review/teacher/add_material_model/view.dart';
import 'package:school/app/modules/subject_review/teacher/add_meal_model/view.dart';
import 'package:school/app/modules/subject_review/teacher/add_quran_evaluation/view.dart';
import 'package:school/app/modules/subjects/student/events/view.dart';
import 'package:school/app/modules/subjects/teacher/add_activity/view.dart';
import '../modules/Auth/login/view.dart';
import '../modules/Auth/signup/view.dart';
import '../modules/about_us/view.dart';
import '../modules/add_attendence/view.dart';
import '../modules/chat/chat_messages/view.dart';
import '../modules/home/student/home_view.dart';
import '../modules/home/student/honor/view.dart';
import '../modules/onboarding_screen.dart';
import '../modules/semesters/view.dart';
import '../modules/settings/profile_view/view.dart';
import '../modules/settings/student/view.dart';
import '../modules/splash_screen.dart';
import '../modules/students/studentsForReview.dart';
import '../modules/subject_review/student/interactive_periods/view.dart';
import '../modules/subject_review/student/material_model/view.dart';
import '../modules/subject_review/student/meal_model/view.dart';
import '../modules/subject_review/student/parent_comment/view.dart';
import '../modules/subject_review/student/quran_evaluation/view.dart';
import '../modules/subject_review/teacher/view.dart';
import '../modules/subjects/student/chapters/view.dart';
import '../modules/subjects/student/homeworks/view.dart';
import '../modules/subjects/student/subject_details/view.dart';
import '../modules/subjects/student/view.dart';
import '../modules/subjects/teacher/add_assignment/view.dart';
import '../modules/subjects/teacher/add_chapter/view.dart';
import '../modules/subjects/teacher/teacher_subject_details/view.dart';
import '../modules/subjects/teacher/view.dart';
import '../modules/table/view.dart';
import '../modules/teacher_subjects_list/view.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page:()=> SplashScreen()),
  GetPage(name: "/splash_screen", page:()=> SplashScreen()),
  GetPage(name: "/onBoarding-screen", page:()=> OnboardingScreen(),middlewares: [
    MyMiddleware(),
  ]),
  GetPage(name: "/login-screen", page:()=> LoginScreen()),
  GetPage(name: "/signup-screen", page:()=> SignupScreen()),
  GetPage(name: "/child-selection-screen", page:()=> ChildSelectionScreen()),
  GetPage(name: "/student-home-screen", page:()=> HomeScreen()),
  GetPage(name: "/teacher-home-screen", page:()=> TeacherHomeScreen()),
  GetPage(name: "/home-screen", page:()=> HomeScreen()),
  GetPage(name: "/subject-details", page:()=> SubjectDetail()),
  GetPage(name: "/teacher-subject-details", page:()=> TeacherSubjectDetail()),
  GetPage(name: "/table-screen", page:()=> TableScreen()),
  GetPage(name: "/add-chapter-screen", page:()=> AddChapterScreen()),
  GetPage(name: "/add-assignment-screen", page:()=> AddAssignmentScreen()),
  GetPage(name: "/add-activity-screen", page:()=> AddActivityScreen()),
  GetPage(name: "/teacher-subjects-screen", page:()=> TeacherSubjectsScreen()),
  GetPage(name: "/teacher-chapters-screen", page:()=> TeacherChapterListScreen()),
  GetPage(name: "/teacher-students-screen", page:()=> TeacherStudentsList()),
  GetPage(name: "/form-review-screen", page:()=> AddFormReview()),
  GetPage(name: "/add-comment-screen", page:()=> AddCommentScreen()),
  GetPage(name: "/add-interactive-periods-screen", page:()=> AddInteractivePeriodsScreen()),
  GetPage(name: "/interactive-periods-screen", page:()=> InteractivePeriodsScreen()),
  GetPage(name: "/add-meal-model-screen", page:()=> AddMealModelsScreen()),
  GetPage(name: "/meal-model-screen", page:()=> MealModelsScreen()),
  GetPage(name: "/add-material-model-screen", page:()=> AddMaterialModelScreen()),
  GetPage(name: "/material-model-screen", page:()=> MaterialModelScreen()),
  GetPage(name: "/add-quran-evaluation-screen", page:()=> AddQuranEvaluationScreen()),
  GetPage(name: "/quran-evaluation-screen", page:()=> QuranEvaluationScreen()),
  GetPage(name: "/teacher-students-forReview-screen", page:()=> TeacherStudentsForReviewList()),

  GetPage(name: "/student-subjects-screen", page:()=> StudentSubjectsScreen()),
  GetPage(name: "/chapter-list-screen", page:()=> ChapterListScreen()),
  GetPage(name: "/homework-list-screen", page:()=> SubjectHomeworkListScreen()),
  GetPage(name: "/settings-screen", page:()=> ProfileScreen()),
  GetPage(name: "/profile-view-screen", page:()=> ProfileViewScreen()),
  GetPage(name: "/edit-profile-screen", page:()=> EditProfileScreen()),
  GetPage(name: "/profile-view-screen", page:()=> HonorScreen()),
  GetPage(name: "/notification-screen", page:()=> NotificationScreen()),
  GetPage(name: "/about-us-screen", page:()=> AboutScreen()),
  GetPage(name: "/event-desc-screen", page:()=> EventDescription()),
  GetPage(name: "/chat-screen", page:()=> ChatScreen()),
  GetPage(name: "/send-new-message-screen", page:()=> SendNewMessageScreen()),
  GetPage(name: "/subject-event-screen", page:()=> SubjectEventScreen()),
  GetPage(name: "/chat-messages-screen", page:()=> ChatMessages()),
  GetPage(name: "/add-points-screen", page:()=> AddPoints()),
  GetPage(name: "/teacher-semesters-screen", page:()=> TeacherSemestersScreen()),
  GetPage(name: "/add-attendances-screen", page:()=> AddAttendancesScreen()),
];