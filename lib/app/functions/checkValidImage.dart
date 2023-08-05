import 'package:http/http.dart' as http;

Future<bool> isValidImage(String url) async {
  final response =
       await http.head(Uri.parse(url));

  if (response.statusCode == 200) {
    return true;
  }
    return false;
  }
