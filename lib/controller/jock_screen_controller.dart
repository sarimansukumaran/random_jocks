import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_jocks/model/jock_model.dart';

class JockScreenController with ChangeNotifier {
  JockModel? jockObj;
  bool isLoding = false;
  Future<void> get() async {
    final url = Uri.parse("https://official-joke-api.appspot.com/random_joke");
    try {
      isLoding = true;
      notifyListeners();
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // print(response.body);
        var convertedjson = jsonDecode(response.body);
        jockObj = JockModel(
            id: convertedjson["id"],
            type: convertedjson["type"],
            setup: convertedjson["setup"],
            punchline: convertedjson["punchline"]);
      }
    } catch (e) {
      print(e);
    }
    isLoding = false;
    notifyListeners();
  }
}
