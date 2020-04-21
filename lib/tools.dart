import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vesseldoc_app/form.dart';
import 'package:vesseldoc_app/user.dart';

class Tools {
  static final Tools _tools = Tools._internal();
  static const String url = "http://192.168.1.101:8080";

  factory Tools() {
    return _tools;
  }

  Tools._internal();

  //test
  dynamic getJson() {
    String json =
        "{title: test, listOfItems: [Container(), Container(), Container()]}";
    return json;
  }

  Future<bool> getJsonFromServer(User user) async {
    final path = "/getJson";
    final response = await http.get(
      url + path,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
    );
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      for (var u in jsondata) {
        FormFill form = FormFill(title: u["title"], listOfItems: u["listOfItems"]);
      }
    }
  }

  FormFill getJsonForm() {
    var jsonStr = """
  {
  "title": "test1",
  "listOfItems": [{"text": "test", "field": "Header"}, {"text": "test", "field": "Slider"}, {"text": "test", "field": "Slider"}]
}
""";
    
    final jsonData = json.decode(jsonStr);
      FormFill form = FormFill(title: jsonData["title"]);
      form.listOfItems = new List<dynamic>();
      form.listOfItems = jsonData["listOfItems"];
      return form;
  }
}
