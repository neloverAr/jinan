import 'package:get/get.dart';

class MyTranslation extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "ar": {
      "appLanguage":"لغة التطبيق",
      "langArabic":"اللغة العربية",
      "langEnglish":"اللغة الانجليزية",
      "chat":"محادثات",
      "main":"الرئيسية",
      "homework":"الواجبات",
      "homeworkSubject":"واجب",
      "lastHomework":"آخر الواجبات",
      "schedule":"جدولي",
      "dailySchedule":"الجدول اليومي",
      "profile":"البروفايل",
      "myProfile":"بروفايلي",
      "editProfile":"تعديل البروفايل",
      "greeting":"مرحباً",
      "myStudents":"طلابي",
      "addPoints":"اضافة نقاط",
      "addSubjects":"اضافة مواضيع",
      "addChapter":"اضافة موضوع",
      "addAssignments":"اضافة واجبات",
      "addActivity":"اضافة نشاط تفاعلى",
      "addAssignment":"اضافة تكليف",
      "add":"اضافة",
      "submit":"حفظ",
      "parentComment":"تقييم الأهل",
      "aboutUs":"من نحن",
      "myPoints":"نقاطي",
      "present":"حاضر",
      "absent":"غائب",
      "forgetPassword":"نسيت كلمة المرور؟",
      "password":"كلمة المرور",
      "sendCode":"ارسل الكود",
      "enterVerificationCode":"ادخل كود التفعيل",
      "phoneNumber":"رقم الهاتف",
      "editPassword":"تعديل كلمة المرور",
      "currentPassword":"كلمة المرور الحالية",
      "newPassword":"كلمة المرور الجديدة",
      "newPasswordConfirmation":"تأكيد كلمة المرور الجديدة",
      "saveNewPassword":"حفظ كلمة المرور الجديدة",
      "logIn":"تسجيل الدخول",
      "logOut":"تسجيل الخروج",
      "subjects":"المواد الدراسية",
      "studentSubjects":"المواد",
      "honorBoard":"لوحة الشرف",
      "seeAll":"عرض الكل",
      "chapters":"المواضيع والتقييمات",
      "activitiesAndEvents":"تغطية يومية",
      "studentDetails":"صفحة تفاصيل الطالب",
      "contactNow":"تواصل الآن",
      "name":"الاسم",
      "level":"المرحلة الدراسية",
      "semester":"الصف",
      "semesters":"الصفوف الدراسية",
      "age":"العمر",
      "gender":"الجنس",
      "noOfPoints":"عدد النقاط",
      "years":"سنوات",
      "points":"نقطة",
      "activities":"الأنشطة",
      "announcements":"اعلانات",
      "initiatives":"مبادرات",
      "dailyCoverage":"تغطية يومية",
      "events":"فعاليات",
      "1":"الصف الأول",
      "2":"الصف الثاني",
      "3":"الصف الثالث",
      "4":"الصف الرابع",
      "5":"الصف الخامس",
      "6":"الصف السادس",
      "7":"الصف السابع",
      "8":"الصف الثامن",
      "save":"حفظ",
      "skip":"تخطي",
      "assignmentName":"اسم الواجب",
      "assignmentNameArabic":"اسم الواجب باللغة العربية",
      "assignmentNameEnglish":"اسم الواجب باللغة الانجليزية",
      "assignmentDetails":"تفاصيل الواجب",
      "assignmentDetailsArabic":"تفاصيل الواجب باللغة العربية",
      "assignmentDetailsEnglish":"تفاصيل الواجب باللغة الانجليزية",
      //////
      "chapterName":"اسم الموضوع",
      "chapterNameArabic":"اسم الموضوع باللغة العربية",
      "chapterNameEnglish":"اسم الموضوع باللغة الانجليزية",
      "chapterDetails":"تفاصيل الموضوع",
      "chapterDetailsArabic":"تفاصيل الموضوع باللغة العربية",
      "chapterDetailsEnglish":"تفاصيل الموضوع باللغة الانجليزية",
      //////
      "activityName":"اسم النشاط",
      "activityNameArabic":"اسم النشاط باللغة العربية",
      "activityNameEnglish":"اسم النشاط باللغة الانجليزية",
      "activityDetails":"تفاصيل النشاط",
      "activityDetailsArabic":"تفاصيل النشاط باللغة العربية",
      "activityDetailsEnglish":"تفاصيل النشاط باللغة الانجليزية",
      //////
      "attachFile":"ارفاق ملف",
      "attachImage":"ارفاق صورة",
      "attachVideo":"ارفاق رابط فيديو",
      "deliveryDateAssignment":"تاريخ التسليم",
      "activityDate":"تاريخ النشاط",
      "chapterOne":"الموضوع الاول",
      "settings":"الاعدادات",
      "studentFile":"ملف الطالب",
      "assessment":"التقييم",
      "assessmentReport":"التقييم",
      "notifications":"التنبيهات",
      "typeSelection":"هل أنت معلمة أم طالب ؟",
      "saturday":"السبت",
      "sunday":"الأحد",
      "monday":"الاثنين",
      "tuesday":"الثلاثاء",
      "wednesday":"الأربعاء",
      "thursday":"الخميس",
      "friday":"الجمعة",
      "teacher":"معلمة",
      "student":"طالب",
      "searchBySubject":"ابحث عن المواد",
      "discipline":"الانضباط",
      "food":"الطعام",
      "focus":"التركيز",
      "attendance":"الحضور والغياب",
      "attendanceList":"سجل الحضور",
      "assignment":"حل الواجبات",
      "interaction":"التفاعل",
      "month":"شهر",
      "week":"الاسبوع",
      "day":"يوم",
      "first":"الأول",
      "second":"الثاني",
      "third":"الثالث",
      "forth":"الرابع",
      "chooseChild":"اختار حساب الطالب",
      "onBoarding1Text":"يوفر لك التطبيق متابعة يومية لأنشطة و فعاليات الطالب",
      "onBoarding2Text":"يتيح لك التطبيق متابعة مهامك وواجبتك بكل سهولة",
      "onBoarding3Text":"إمكانية التواصل المباشر بين المعلم و الطالب",
      "reciteLastHizb":"سرد حزب سابق",
      "tibyan":"التبيان",
      "lettersAndNumbers":"حروف وأرقام",
      "meal":"الوجبة",
      "playground":"الملعب",
      "mainChapters":"الوحدات العلمية",
      "essentials":" الأركان",
      "scienceAndLiterature":"علم وآداب",
      "lastLesson":"اللقاء الأخير",
      "english":"اللغة الانجليزية",
      "dailyFollowUp":"متابعة يومية",
      "excellent":"ممتاز",
      "veryGood":"جيد جداً",
      "good":"جيد",
      "all":"كامل",
      "most":"معظم",
      "little":"بعض",
      "nothing":"لاشيئ",
      "capable":"تمكن",
      "needsFollowup":"يحتاج متابعة",
      "unable":"لم يتمكن",
      "NoSummeryError":" ⚠ لا يوجد اضافات لهذا التاريخ, راجع المعلم",
      "SurahsNames":"أسماء السور",
      "attend":"حضر",
      "notAttend":"لما يحضر",
      "recitePreviousLesson":"تسميع الدرس السابق",
      "hezbPreviousDay":"حزب اليوم السابق",
      "todayHezh":"حزب اليوم",
      "todayLesson":"درس اليوم",
      "from":"من",
      "to":"الى",
      "surah" : "سورة",
      "memorisingAssessment":"تقييم الحفظ",
      "connectAssessment":"تقييم الربط",
      "recitalAssessment":"الترتيل",
      "parentsAssessment":"تقييم الأهل",
      "dailyAssessment":"التقييم اليومي",
      "selectStudent":"اختر الطالب",
      "selectSubject":"اختر المادة",
      "loginError":"ادخلت رقم هاتف او كلمة مرور خطا",
      "dueDate":"موعد التسليم :",
      "noAvailableData":"لا يوجد بيانات مدخلة",
      "firstName":"الاسم الأول",
      "fatherName":"اسم الأب",
      "grandFatherName":"اسم الجد",
      "lastName":"الاسم الأخير",
      "fullName":"الاسم كامل",
      "birthday":"تاريخ الميلاد",
      "idNumber":"رقم الهوية",
      "totalPoints":"مجموع النقاط",
      "switchAccount":"تبديل الحساب",
      "email":"البريد الالكتروني",
      "mobile":"رقم الموبايل",
      "address":"العنوان",
      "publishedFrom":"تم نشره منذ ",
      "typing":"أكتب رسالتك هنا.. .",
      "addAttendance":"تسجيل الحضور",
      "noResults":"لا يوجد نتائج",
      "searchingResultsFor":"نتائج البحث ل ",
      "attachments":"مرفقات",
      "interactivePeriods":"فترات تفاعلية",
      "quranEvaluation":"تقييم القران",
      "mealAssessment":"تقييم الوجبة",
      "mealAmount":"مقدار الوجبة",
      "materialAssessment":"تقييم المادة",
      "interactive":"متفاعل",
      "notInteractive":"غير متفاعل",
      "absents":"لم يحضر",
      "eat":"تناول",
      "suitable":"مناسب",
      "notSuitable":"غير مناسب",
      "note":"ملاحظة",
      "startNewConversation":"بدأ محادثة جديدة",
      "selectReceiverName":"اختر اسم المستلم",
      "senderName":"المرسل: ",
      "send":"إرسال",
      "noSons":"لا يوجد أبناء مسجلين",
      "backToLoginPage":"اضغط هنا للرجوع لصفحة تسجيل الدخول",
      "weeklyPlan":"الخطة الأسبوعية",
      "seeWeeklyPlan":"الاطلاع على الخطة الأسبوعية",
      "exitButton":"نداء الخروج",
      "exitButtonInfo":"بعد الضغط على هذا الزر سيتم ارسال رسالة الى معلمين طفلك ليقوموا باخراجه",
      "exitButtonConfirm":"هل أنت متأكد من ارسال نداء الخروج؟",
      "ok":"حسناً",
      "yes":"نعم",
      "cancel":"إلغاء",
      "daysOfAttendance":"عدد أيام الحضور",
      "dayOfAbsence":"عدد أيام الغياب",
    },
    "en":{
     "appLanguage":"Change Language",
     "langArabic":"Arabic",
     "langEnglish":"English",
      "chat":"Chat",
      "main":"Homepage",
      "homework":"Assignments",
      "homeworkSubject":"Homework",
      "lastHomework":"Recent Assignments",
      "schedule":"Schedule",
      "dailySchedule":"Schedule",
      "profile":"Profile",
      "myProfile":"My Profile",
      "editProfile":"Edit Profile",
      "greeting":"Hi",
      "myStudents":"My Students",
      "addPoints":"Add Points",
      "addSubjects":"Add Subjects",
      "addChapter":"Add Chapter",
      "addAssignments":"Add Assignments",
      "addAssignment":"Add Assignment",
      "addActivity":"Add Activity",
      "add":"Add",
      "submit":"Submit",
      "parentComment":"Parent Review",
      "aboutUs":"About Us",
      "myPoints":"My points",
      "forgetPassword":"Forget Password?",
      "password":"Password",
      "phoneNumber":"Phone Number",
      "sendCode":"SEND CODE",
      "enterVerificationCode":"Enter Verification Code",
      "editPassword":"Edit Password",
      "currentPassword":"Current Password",
      "newPassword":"New Password",
      "newPasswordConfirmation":"New Password Confirmation",
      "saveNewPassword":"Save New Password",
      "logIn":"LOGIN",
      "logOut":"Log Out",
      "subjects":"Subjects",
      "studentSubjects":"Subjects",
      "honorBoard":"Honor Board",
      "seeAll":"See All",
      "chapters":"Chapters and Reviews",
      "activitiesAndEvents":"Daily Coverage",
      "studentDetails":"Student Details",
      "contactNow":"Contact Now",
      "name":"Name",
      "level":"Level",
      "present":"P",
      "absent":"A",
      "semester":"Semester",
      "semesters":"Semesters",
      "age":"Age",
      "gender":"Gender",
      "noOfPoints":"Total Points",
      "years":"Years",
      "points":"Points",
      "activities":"Activities",
      "announcements":"Announcements",
      "initiatives":"Initiatives",
      "dailyCoverage":"Daily Coverage",
      "events":"Events",
      "1":"First Grade",
      "2":"Second Grade",
      "3":"Third Grade",
      "4":"Fourth Grade",
      "5":"Fifth Grade",
      "6":"Sixth Grade",
      "7":"Seventh Grade",
      "8":"Eight Grade",
      "save":"Save",
      "skip":"Skip",
      "assignmentName":"Assignment Name",
      "assignmentNameArabic":"Arabic Assignment Name",
      "assignmentNameEnglish":"English Assignment Name",
      "assignmentDetails":"Assignment Details",
      "assignmentDetailsArabic":"Arabic Assignment Details",
      "assignmentDetailsEnglish":"English Assignment Details",
      //////
      "chapterName":"Chapter Name",
      "chapterNameArabic":"Arabic Chapter Name",
      "chapterNameEnglish":"English Chapter Name",
      "chapterDetails":"Chapter Details",
      "chapterDetailsArabic":"Arabic Chapter Details",
      "chapterDetailsEnglish":"English Chapter Details",
      //////
      "activityName":"Activity Name",
      "activityNameArabic":"Arabic Activity Name",
      "activityDetails":"Activity Details",
      "activityNameEnglish":"English Activity Name",
      "activityDetailsArabic":"Arabic Activity Details",
      "activityDetailsEnglish":"English Activity Details",
      //////
      "attachFile":"Attach File",
      "attachImage":"Attach Image",
      "attachVideo":"Attach Video link",
      "deliveryDateAssignment":"Delivery Date",
      "activityDate":"Activity Date",
      "chapterOne":"Chapter One",
      "settings":"Settings",
      "studentFile":"Student File",
      "assessment":"Assessment",
      "assessmentReport":"Assessment Report",
      "notifications":"Notifications",
      "typeSelection":"What's your role?",
      "saturday":"Saturday",
      "sunday":"Sunday",
      "monday":"Monday",
      "tuesday":"Tuesday",
      "wednesday":"Wednesday",
      "thursday":"Thursday",
      "friday":"Friday",
      "teacher":"Teacher",
      "student":"Student",
      "searchBySubject":"Search By Subject",
      "discipline":"Discipline",
      "food":"Food",
      "focus":"Focus",
      "attendance":"Attendance",
      "attendanceList":"Attendance Record",
      "assignmentSubmission":"Assignment",
      "interaction":"Interaction",
      "month":"Month",
      "week":"week",
      "day":"Day",
      "first":"First",
      "second":"Second",
      "third":"Third",
      "forth":"Forth",
      "chooseChild":"Choose An Account",
      "onBoarding1Text":"The application provides you with a daily follow-up of the student's activities and events.",
      "onBoarding2Text":"The application will allow you to track your daily tasks smoothly",
      "onBoarding3Text":"Provides a direct communication between the teacher and the student",
      "reciteLastHizb":"Recite Last Hizb",
      "tibyan":"Tibyan",
      "lettersAndNumbers":"Letters and Numbers",
      "meal":"Meal",
      "playground":"Playground",
      "mainChapters":"Main Chapters",
      "essentials":"Essentials",
      "scienceAndLiterature":"Science and Literature",
      "lastLesson":"Last Lesson",
      "english":"English",
      "dailyFollowUp":"Daily Follow-up",
      "excellent":"Excellent",
      "veryGood":"Very Good",
      "good":"Good",
      "all":"All",
      "most":"Most",
      "little":"a Little",
      "nothing":"Nothing",
      "capable":"versed",
      "needsFollowup":"Needs Followup",
      "unable":"unversed",
      "NoSummeryError":"No Day Summery for this Date ⚠",
      "SurahsNames":"Surahs names",
      "attend":"Attend",
      "notAttend":"Not Attend",
      "recitePreviousLesson":"Recite Previous Lesson",
      "hezbPreviousDay":"Hezb of The Previous Day",
      "todayHezh":"Today's Hezh",
      "todayLesson":"Today's Lesson",
      "from":"from",
      "to":"to",
      "surah" : "surah",
      "memorisingAssessment":"Save Verses",
      "connectAssessment":"Link Verses",
      "recitalAssessment":"Recital",
      "parentsAssessment":"Parents AX",
      "dailyAssessment":"Daily Assessment",
      "selectStudent":"Select Student",
      "selectSubject":"Select Subject",
      "loginError":"Phone number or Password is incorrect",
      "dueDate":"Due Date:",
      "noAvailableData":"No Available Data",
      "firstName":"First Name",
      "fatherName":"Father Name",
      "grandFatherName":"Grandfather Name",
      "lastName":"Last Name",
      "fullName":"Full Name",
      "birthday":"Birthday",
      "idNumber":"ID Number",
      "totalPoints":"Total Points",
      "switchAccount":"Switch Account",
      "email":"Email",
      "mobile":"Mobile Number",
      "address":"Address",
      "publishedFrom":"Published From",
      "typing":"Type your message here...",
      "addAttendance":"Add Attendance",
      "noResults":"No Results",
      "searchingResultsFor":"Searching results for",
      "attachments":"Attachments",
      "interactivePeriods":"Interactive Periods",
      "quranEvaluation":"Quran Evaluation",
      "mealAssessment":"Meal Assessment",
      "mealAmount":"Meal amount",
      "materialAssessment":"Material Assessment",
      "interactive":"Interactive",
      "notInteractive":"Not Interactive",
      "absents":"Absent",
      "eat":"Have eaten",
      "suitable":"suitable",
      "notSuitable":"not suitable",
      "note":"Note",
      "startNewConversation":"Start New Conversation",
      "selectReceiverName":"Select Receiver Name",
      "senderName":"The sender: ",
      "send":"Send",
      "noSons":"No Registered Sons",
      "backToLoginPage":"Press here to Back to Login Page",
      "weeklyPlan":"Weekly Plan",
      "seeWeeklyPlan":"Check weekly plan",
      "exitButton":"Exit Button",
      "exitButtonInfo":"After pressing this button, a message will be sent to your child's teachers asking them to get him out",
      "exitButtonConfirm":"Are you sure you want to send the exit order?",
      "ok":"OK",
      "yes":"Yes",
      "cancel":"Cancel",
      "daysOfAttendance":"Days of attendance",
      "dayOfAbsence":"Day of Absence",
    }
  };

}