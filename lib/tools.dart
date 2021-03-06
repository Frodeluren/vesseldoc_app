import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:vesseldoc_app/filled_form.dart';
import 'package:vesseldoc_app/form_structure.dart';
import 'package:vesseldoc_app/token_service.dart';
import 'package:vesseldoc_app/user.dart';

/// Singleton class acting as a service to multiple widgets.
class Tools {
  static final Tools _tools = Tools._internal();
  static String url;
  User currentUserLoggedIn;

  List<Widget> itemsInDataTable = new List<Widget>();

  String token;
  factory Tools() {
    return _tools;
  }

  Tools._internal();

  Future<bool> login(String username, String password, String address) async {
    String path = "/authenticate";
    Map<String, String> headers = {"Content-type": "application/json"};
    url = "http://" + address;
    var response = await http.post(url + path,
        headers: headers,
        body: '{"username": "$username", "password": "$password"}');

    if (response.statusCode == 200) {
      TokenService ts = new TokenService();
      ts.writeToken(response.body);
      var decData = json.decode(response.body);
      token = decData["token"];
      await getCurrentUser();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(String username, String password, String role) async {
    String path = "/register";
    Map<String, String> headers = {"Content-type": "application/json"};

    var response = await http.post(url + path,
        headers: headers,
        body: '{"username": "$username", "password": "$password"}');

    if (response.statusCode == 200) {
      if (role != "WORKER") {
        var responseOnRoleSet = await http.post(
          url + "/user/set/role?username=$username&role=$role",
          headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
        );
        if (responseOnRoleSet.statusCode == 200) {
          return true;
        }
      }
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setUserRole(String username, String role) async {
    var responseOnRoleSet = await http.post(
      url + "/user/set/role?username=$username&role=$role",
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    if (responseOnRoleSet.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signForm(FilledForm form) async {
    var formId = form.id;
    var response = await http.post(
      url + "/form/set/sign?form_id=$formId",
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deactivateUser(String username) async {
    var response = await http.post(
      url + "/user/set/deactivate?username=$username",
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    if (response.statusCode == 200) {
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

    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      for (var item in jsondata) {
        User user = new User(item["username"]);
        if (item["roleId"] == 0) {
          user.role = "Admin";
        }
        if (item["roleId"] == 1) {
          user.role = "Worker";
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

  Future<List<FilledForm>> getListOfFilledOutForms() async {
    List<FilledForm> listOfFilledForms = new List<FilledForm>();
    final path = "/form/list";
    final response = await http.get(
      url + path,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      print(response.body);

      for (var structure in jsondata) {
        FilledForm filledForm = new FilledForm();
        Map filledFormMap = structure[3];
        dynamic temp = filledFormMap.values.toList();
        filledForm.whichUser = structure[1];
        filledForm.signedBy = structure[2];
        filledForm.name = structure[0];
        filledForm.id = temp[0];
        filledForm.isSigned = temp[4];
        String timeStampRaw = temp[3];
        filledForm.dateTime =
            timeStampRaw.substring(0, timeStampRaw.length - 9);
        listOfFilledForms.add(filledForm);
      }
      return listOfFilledForms;
    }
    print(response.body);
    return [];
  }

  Future<List<FilledForm>> getListOfAllUnsignedFilledOutForms() async {
    List<FilledForm> listOfFilledForms = new List<FilledForm>();
    final path = "/form/list/notsigned";
    final response = await http.get(
      url + path,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);

      for (var structure in jsondata) {
        FilledForm filledForm = new FilledForm();
        Map filledFormMap = structure[2];
        dynamic temp = filledFormMap.values.toList();
        filledForm.signedBy = temp[5].toString();
        filledForm.name = structure[0];
        filledForm.id = temp[0];
        filledForm.isSigned = temp[4];
        String timeStampRaw = temp[3];
        filledForm.dateTime =
            timeStampRaw.substring(0, timeStampRaw.length - 9);
        listOfFilledForms.add(filledForm);
      }
      return listOfFilledForms;
    }
    return [];
  }

  Future<Map> getWantedFilledForm(FilledForm filledForm) async {
    final path = "/form/get/" + filledForm.id;
    final response = await http.get(
      url + path,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return map;
    } else
      return null;
  }

  Future<Map> getWantedFormStructure(FormStructure str) async {
    final path = "/structure/get/" + str.id.toString();
    final response = await http.get(
      url + path,
      headers: {HttpHeaders.authorizationHeader: "Bearer " + token},
    );
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return map;
    } else
      return null;
  }

  Future<bool> getCurrentUser() async {
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
        user.role = "Worker";
      }
      currentUserLoggedIn = user;
      return true;
    } else
      return false;
  }

  Future<bool> uploadStructure(String title, dynamic data) async {
    final path = "/structure/set?title=" + title;
    //Make a file
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    String fileName = tempPath + "/$title.json";
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
      var jsonData = json.encode(data);
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      String fileName = tempPath + "/$temp.json";

      new File(fileName).writeAsStringSync("$jsonData");
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
