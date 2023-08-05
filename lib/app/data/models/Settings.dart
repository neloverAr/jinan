class Settings {
  int? id;
  String? logoImage;
  String? arName;
  String? enName;
  String? arHeaderTitle;
  String? enHeaderTitle;
  String? arHeaderDescription;
  String? enHeaderDescription;
  String? arDownloadAppTitle;
  String? enDownloadAppTitle;
  String? arDownloadAppDescription;
  String? enDownloadAppDescription;
  String? arFooterDescription;
  String? enFooterDescription;
  String? arContactTitle;
  String? enContactTitle;
  String? arContactDescription;
  String? enContactDescription;
  String? appAppleUrl;
  String? youtubeUrl;
  String? appAndroidUrl;
  String? arAddress;
  String? enAddress;
  String? arWorkTime;
  String? enWorkTime;
  String? arWorkDays;
  String? enWorkDays;
  String? arAboutUsTitlePage;
  String? enAboutUsTitlePage;
  String? arAboutUsDescriptionPage;
  String? enAboutUsDescriptionPage;
  String? mobile;
  String? email;
  String? fax;
  String? telephone;
  String? whatsapp;
  String? facebook;
  String? twitter;
  String? instagram;
  String? google;
  String? pannelMainColor;
  String? pannelSecondaryColor;
  String? fastAccessColor;
  String? pannelMood;
  String? pannelType;
  String? name;
  String? address;
  String? headerTitle;
  String? headerDescription;
  String? downloadAppTitle;
  String? downloadAppDescription;
  String? workTime;
  String? workDays;
  String? contactTitle;
  String? contactDescription;
  String? footerDescription;
  String? aboutUsTitlePage;
  String? aboutUsDescriptionPage;

  Settings(
      {this.id,
        this.logoImage,
        this.arName,
        this.enName,
        this.arHeaderTitle,
        this.enHeaderTitle,
        this.arHeaderDescription,
        this.enHeaderDescription,
        this.arDownloadAppTitle,
        this.enDownloadAppTitle,
        this.arDownloadAppDescription,
        this.enDownloadAppDescription,
        this.arFooterDescription,
        this.enFooterDescription,
        this.arContactTitle,
        this.enContactTitle,
        this.arContactDescription,
        this.enContactDescription,
        this.appAppleUrl,
        this.youtubeUrl,
        this.appAndroidUrl,
        this.arAddress,
        this.enAddress,
        this.arWorkTime,
        this.enWorkTime,
        this.arWorkDays,
        this.enWorkDays,
        this.arAboutUsTitlePage,
        this.enAboutUsTitlePage,
        this.arAboutUsDescriptionPage,
        this.enAboutUsDescriptionPage,
        this.mobile,
        this.email,
        this.fax,
        this.telephone,
        this.whatsapp,
        this.facebook,
        this.twitter,
        this.instagram,
        this.google,
        this.pannelMainColor,
        this.pannelSecondaryColor,
        this.fastAccessColor,
        this.pannelMood,
        this.pannelType,
        this.name,
        this.address,
        this.headerTitle,
        this.headerDescription,
        this.downloadAppTitle,
        this.downloadAppDescription,
        this.workTime,
        this.workDays,
        this.contactTitle,
        this.contactDescription,
        this.footerDescription,
        this.aboutUsTitlePage,
        this.aboutUsDescriptionPage});

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoImage = json['logo_image'];
    arName = json['ar_name'];
    enName = json['en_name'];
    arHeaderTitle = json['ar_header_title'];
    enHeaderTitle = json['en_header_title'];
    arHeaderDescription = json['ar_header_description'];
    enHeaderDescription = json['en_header_description'];
    arDownloadAppTitle = json['ar_download_app_title'];
    enDownloadAppTitle = json['en_download_app_title'];
    arDownloadAppDescription = json['ar_download_app_description'];
    enDownloadAppDescription = json['en_download_app_description'];
    arFooterDescription = json['ar_footer_description'];
    enFooterDescription = json['en_footer_description'];
    arContactTitle = json['ar_contact_title'];
    enContactTitle = json['en_contact_title'];
    arContactDescription = json['ar_contact_description'];
    enContactDescription = json['en_contact_description'];
    appAppleUrl = json['app_apple_url'];
    youtubeUrl = json['youtube_url'];
    appAndroidUrl = json['app_android_url'];
    arAddress = json['ar_address'];
    enAddress = json['en_address'];
    arWorkTime = json['ar_work_time'];
    enWorkTime = json['en_work_time'];
    arWorkDays = json['ar_work_days'];
    enWorkDays = json['en_work_days'];
    arAboutUsTitlePage = json['ar_about_us_title_page'];
    enAboutUsTitlePage = json['en_about_us_title_page'];
    arAboutUsDescriptionPage = json['ar_about_us_description_page'];
    enAboutUsDescriptionPage = json['en_about_us_description_page'];
    mobile = json['mobile'];
    email = json['email'];
    fax = json['fax'];
    telephone = json['telephone'];
    whatsapp = json['whatsapp'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    google = json['google'];
    pannelMainColor = json['pannel_main_color'];
    pannelSecondaryColor = json['pannel_secondary_color'];
    fastAccessColor = json['fast_access_color'];
    pannelMood = json['pannel_mood'];
    pannelType = json['pannel_type'];
    name = json['name'];
    address = json['address'];
    headerTitle = json['header_title'];
    headerDescription = json['header_description'];
    downloadAppTitle = json['download_app_title'];
    downloadAppDescription = json['download_app_description'];
    workTime = json['work_time'];
    workDays = json['work_days'];
    contactTitle = json['contact_title'];
    contactDescription = json['contact_description'];
    footerDescription = json['footer_description'];
    aboutUsTitlePage = json['about_us_title_page'];
    aboutUsDescriptionPage = json['about_us_description_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_image'] = this.logoImage;
    data['ar_name'] = this.arName;
    data['en_name'] = this.enName;
    data['ar_header_title'] = this.arHeaderTitle;
    data['en_header_title'] = this.enHeaderTitle;
    data['ar_header_description'] = this.arHeaderDescription;
    data['en_header_description'] = this.enHeaderDescription;
    data['ar_download_app_title'] = this.arDownloadAppTitle;
    data['en_download_app_title'] = this.enDownloadAppTitle;
    data['ar_download_app_description'] = this.arDownloadAppDescription;
    data['en_download_app_description'] = this.enDownloadAppDescription;
    data['ar_footer_description'] = this.arFooterDescription;
    data['en_footer_description'] = this.enFooterDescription;
    data['ar_contact_title'] = this.arContactTitle;
    data['en_contact_title'] = this.enContactTitle;
    data['ar_contact_description'] = this.arContactDescription;
    data['en_contact_description'] = this.enContactDescription;
    data['app_apple_url'] = this.appAppleUrl;
    data['youtube_url'] = this.youtubeUrl;
    data['app_android_url'] = this.appAndroidUrl;
    data['ar_address'] = this.arAddress;
    data['en_address'] = this.enAddress;
    data['ar_work_time'] = this.arWorkTime;
    data['en_work_time'] = this.enWorkTime;
    data['ar_work_days'] = this.arWorkDays;
    data['en_work_days'] = this.enWorkDays;
    data['ar_about_us_title_page'] = this.arAboutUsTitlePage;
    data['en_about_us_title_page'] = this.enAboutUsTitlePage;
    data['ar_about_us_description_page'] = this.arAboutUsDescriptionPage;
    data['en_about_us_description_page'] = this.enAboutUsDescriptionPage;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['fax'] = this.fax;
    data['telephone'] = this.telephone;
    data['whatsapp'] = this.whatsapp;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['google'] = this.google;
    data['pannel_main_color'] = this.pannelMainColor;
    data['pannel_secondary_color'] = this.pannelSecondaryColor;
    data['fast_access_color'] = this.fastAccessColor;
    data['pannel_mood'] = this.pannelMood;
    data['pannel_type'] = this.pannelType;
    data['name'] = this.name;
    data['address'] = this.address;
    data['header_title'] = this.headerTitle;
    data['header_description'] = this.headerDescription;
    data['download_app_title'] = this.downloadAppTitle;
    data['download_app_description'] = this.downloadAppDescription;
    data['work_time'] = this.workTime;
    data['work_days'] = this.workDays;
    data['contact_title'] = this.contactTitle;
    data['contact_description'] = this.contactDescription;
    data['footer_description'] = this.footerDescription;
    data['about_us_title_page'] = this.aboutUsTitlePage;
    data['about_us_description_page'] = this.aboutUsDescriptionPage;
    return data;
  }
}