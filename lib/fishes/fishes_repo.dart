import 'dart:convert';
import 'package:acnh_buddy/global/global_endpoints.dart';
import 'package:http/http.dart' as http;


class FishesRepo{
  Future getAllFishes()async{
    final url = '${GlobalEndpoints().baseUrl}fish';

    try {
      var response = await http.get(url);


      List fishes=[];

      json.decode(response.body).forEach((key, value) =>fishes.add(value));
      fishes.sort((a, b) {
        return a['file-name'].toString().toLowerCase().compareTo(b['file-name'].toString().toLowerCase());
      });
      return fishes;

    }catch(error){
      throw(error);
    }

  }
}