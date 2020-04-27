import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:vesseldoc_app/form.dart';
import 'package:vesseldoc_app/form_structure.dart';
import 'package:vesseldoc_app/token_service.dart';
import 'package:vesseldoc_app/user.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:http_parser/http_parser.dart';

class Tools {
  static final Tools _tools = Tools._internal();
  static const String url = "http://vesseldoc.net:8080";

  List<Widget> itemsInDataTable = new List<Widget>();

  String token;
  factory Tools() {
    return _tools;
  }

  Tools._internal();

  Future<bool> login(String username, String password) async {
    String path = "/authenticate";
    Map<String, String> headers = {"Content-type": "application/json"};
    print(url);
    print('username: "$username" \npassword: "$password"');

    var response = await http.post(url + path,
        headers: headers,
        body: '{"username": "$username", "password": "$password"}');
    print("Response code: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      TokenService ts = new TokenService();
      ts.writeToken(response.body);
      var decData = json.decode(response.body);
      token = decData["token"];
      return true;
    } else {
      return false;
    }
  }

  Future<List<User>> getListOfUsers() async {
    List<User> listOfUsers = new List<User>();
    String path = "/user/get/list";
    var response = await http.get(
      url + path,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    print("Response code: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      for (var item in jsondata) {
        User user = new User(item["username"]);
        if (item["roleId"] == 0) {
          user.role = "Admin";
        }
        if (item["roleId"] == 1) {
          user.role = "Deckcrew";
        }
        listOfUsers.add(user);
      }
      return listOfUsers;
    } else {
      return [];
    }
  }

  Future<List<FormStructure>> getListOfAvailableFormStructures() async {
    List<FormStructure> listOfAvailStructures = new List<FormStructure>();
    final path = "/structure/list";
    final response = await http.get(
      url + path,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);

      for (var structure in jsondata) {
        FormStructure formStruct = new FormStructure();
        formStruct.id = structure[0];
        formStruct.name = structure[1];
        listOfAvailStructures.add(formStruct);
      }
      return listOfAvailStructures;
    }
    return null;
  }

  Future<Map> getWantedFormStructure(FormStructure str) async {
    final path = "/structure/get/" + str.id.toString();
    final response = await http.get(
      url + path,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    if (response.statusCode == 200) {
      print(response.body);

      Map<String, dynamic> map = json.decode(response.body);
      return map;
    } else
      return null;
  }

  Future<User> getCurrentUSer() async {
    final path = "/user/get/details";
    final response = await http.get(
      url + path,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      User user = new User(jsondata["username"]);
      if (jsondata["roleId"] == 0) {
        user.role = "Admin";
      }
      if (jsondata["roleId"] == 1) {
        user.role = "Deckcrew";
      }
      return user;
    } else
      return null;
  }

  Future<bool> uploadStructure(String title, dynamic data) async {
    final path = "/structure/set?title=" + title;
    //Make a file
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    String fileName = tempPath + "/$title.json";
    //var jsonData = json.encode(data);
    new File(fileName).writeAsStringSync("$data");
    var request = http.MultipartRequest('POST', Uri.parse(url + path));
    request.headers["authorization"] = "Bearer " + token;
    request.files.add(http.MultipartFile('content',
        File(fileName).readAsBytes().asStream(), File(fileName).lengthSync(),
        filename: fileName.split("/").last));

    var res = await request.send();

    //If form was uploaded, return true
    if (res.statusCode == 200) {
      return true;
    }
    // print(res);
    return false;
  }

  Future<bool> sendFilledOutForm(dynamic data, FormStructure str) async {
    final path = "/newForm?structure_id=" + str.id.toString();
    final response = await http.post(
      url + path,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    if (response.statusCode == 200) {
      String formId = response.body;
      final pathFilledForm = "/form/set?id=" + formId;
      //Make a file
      var temp = str.name;
      print(data);
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      String fileName = tempPath + "/$temp.json";

      new File(fileName).writeAsStringSync("$data");
      var request =
          http.MultipartRequest('POST', Uri.parse(url + pathFilledForm));
      request.headers["authorization"] = "Bearer " + token;
      request.files.add(http.MultipartFile('file',
          File(fileName).readAsBytes().asStream(), File(fileName).lengthSync(),
          filename: fileName.split("/").last));

      var res = await request.send();

      //If form was uploaded, return true
      if (res.statusCode == 200) {
        return true;
      }
      // print(res);
      return false;
    }
    return false;
  }

  void moveItemInList(int oldIndex, int newIndex) {
    final item = itemsInDataTable.removeAt(oldIndex);

    itemsInDataTable.insert(newIndex, item);
  }

  void deleteFromDatatable(Widget item) {
    itemsInDataTable.remove(item);
  }
}
