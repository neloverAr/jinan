
import 'package:url_launcher/url_launcher.dart';

 launchURL(String url) async {
  //const url = 'https://flutter.io';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
