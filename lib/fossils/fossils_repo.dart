import 'dart:convert';

import 'package:acnh_buddy/global/global_endpoints.dart';
import 'package:http/http.dart' as http;

class FossilsRepo {
  Future getAllFossils() async {
    final url = '${GlobalEndpoints().baseUrl}fossils';

    try {
      var response = await http.get(url);

      List fossils = [];

      json.decode(response.body).forEach((key, value) => fossils.add(value));
      fossils.sort((a, b) {
        return a['file-name']
            .toString()
            .toLowerCase()
            .compareTo(b['file-name'].toString().toLowerCase());
      });
      return fossils;
    } catch (error) {
      throw (error);
    }
  }
}
