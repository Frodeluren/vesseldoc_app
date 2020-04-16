import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FormCreatorScreen extends StatefulWidget {
  @override
  _FormCreatorScreenState createState() => _FormCreatorScreenState();
}

class _FormCreatorScreenState extends State<FormCreatorScreen> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.97,
          height: MediaQuery.of(context).size.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Row(
                  children: <Widget>[
                    Text(
                      "FORM CREATOR",
                      style: TextStyle(fontSize: 48, color: Colors.white),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 10),
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
                                "Access level:",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.44,
                                child: DropdownButton(
                                  isExpanded: true,
                                  hint: Text("Select item"),
                                  items: [
                                    DropdownMenuItem(
                                        value: "1", child: Text("1")),
                                    DropdownMenuItem(
                                        value: "2", child: Text("2")),
                                    DropdownMenuItem(
                                        value: "3", child: Text("3"))
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  },
                                  value: _value,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.58,
                      color: Color.fromARGB(255, 200, 200, 200),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Container(height: 10, width: 10, color: Colors.white)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
