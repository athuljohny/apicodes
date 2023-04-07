import 'dart:convert';

import 'package:http/http.dart' as http;
import '/model/detailsdata.dart';

class HelperService {
  static Future<List<Datum>> getCourses() async {
    var client = http.Client();
    var uri =
        'https://datausa.io/api/data?drilldowns=Nation&measures=Population';
    var url = Uri.parse(uri);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final courses = Courses.fromJson(jsonData).data ?? List<Datum>.empty();
      return courses;
    } else {
      return getCourses();
    }
  }
}
