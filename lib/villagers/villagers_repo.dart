import 'dart:convert';

import 'package:acnh_buddy/global/global_endpoints.dart';
import 'package:http/http.dart' as http;

class VillagersRepo {
  Future getAllVillagers() async {
    final url = '${GlobalEndpoints().baseUrl}villagers';

    try {
      var response = await http.get(url);

      List villagers = [];

      json.decode(response.body).forEach((key, value) => villagers.add(value));
      villagers.sort((a, b) {
        return a['file-name']
            .toString()
            .toLowerCase()
            .compareTo(b['file-name'].toString().toLowerCase());
      });
      return villagers;
    } catch (error) {
      throw (error);
    }
  }
}
