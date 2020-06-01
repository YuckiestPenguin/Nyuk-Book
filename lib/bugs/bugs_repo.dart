import 'dart:convert';

import 'package:acnh_buddy/global/global_endpoints.dart';
import 'package:http/http.dart' as http;

class BugsRepo {
  Future getAllBugs() async {
    final url = '${GlobalEndpoints().baseUrl}bugs';

    try {
      var response = await http.get(url);

      List bugs = [];

      json.decode(response.body).forEach((key, value) => bugs.add(value));
      bugs.sort((a, b) {
        return a['file-name']
            .toString()
            .toLowerCase()
            .compareTo(b['file-name'].toString().toLowerCase());
      });
      return bugs;
    } catch (error) {
      throw (error);
    }
  }
}
