import 'dart:convert';

import 'package:http/http.dart' as http;
import '/model/detailsdata.dart';

class HelperService {
  Future<Post?> getPosts() async {
    var client = http.Client();
    var uri =
        'https://datausa.io/api/data?drilldowns=Nation&measures=Population';

    var url = Uri.parse(uri);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Post.fromJson(json);
    }
  }
}
