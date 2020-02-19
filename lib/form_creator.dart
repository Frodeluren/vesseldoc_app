import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FormCreatorScreen extends StatefulWidget {
  @override
  _FormCreatorScreenState createState() => _FormCreatorScreenState();
}

class _FormCreatorScreenState extends State<FormCreatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        left: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "FORM CREATOR",
                          style: TextStyle(fontSize: 60, color: Colors.white),
                        ),
                        SizedBox(width: 20),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Title:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Container(
                                      height: 30,
                                      color: Colors.black12,
                                      child: TextField(
                                        style: new TextStyle(fontSize: 20.0),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Access:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5),
                                  DropdownButton(
                                    hint: Text("Select item"),
                                    value: "",
                                  ),
                                ],
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.6,
                          color: Color.fromARGB(255, 200, 200, 200),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
