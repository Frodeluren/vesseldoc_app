import 'dart:convert';
import 'package:json_to_form/json_schema.dart';
import 'package:flutter/material.dart';
import 'package:vesseldoc_app/dashboard.dart';
import 'package:vesseldoc_app/form_structure.dart';
import 'package:vesseldoc_app/tools.dart';

class FormFillerScreen extends StatefulWidget {
  @override
  _FormFillerScreenState createState() => _FormFillerScreenState();

  FormStructure formStructure;
  FormFillerScreen({this.formStructure});
}

class _FormFillerScreenState extends State<FormFillerScreen> {
  @override
  void initState() {
    super.initState();
    _future = tools.getWantedFormStructure(widget.formStructure);
  }

  final GlobalKey<ScaffoldState> _scaffoldKeySendList =
      new GlobalKey<ScaffoldState>();
  var tools = Tools();
  Future<Map> _future;

  Map form = {
    'autoValidated': false,
    'fields': [
      {
        'key': 'name',
        'type': 'Input',
        'label': 'Vessel',
        'placeholder': "Vessel name",
        'required': true,
      },
      {
        'key': 'name2',
        'type': 'Input',
        'label': 'Job supervisor',
        'placeholder': "Job supervisor",
        'required': true,
      },
      {
        'key': 'switch1',
        'type': 'Switch',
        'label': 'Signed TBT S16 attached',
        'value': false,
      },
      {
        'key': 'switch1',
        'type': 'Switch',
        'label': 'RA Ref no or attached RA',
        'value': false,
      },
      {
        'key': 'checkbox1',
        'type': 'Checkbox',
        'label': 'The Work Permit is valid for:',
        'items': []
      },
      {
        'key': 'checkbox1',
        'type': 'Checkbox',
        'hiddenLabel': 'true',
        'label': 'The Work Permit is valid for:',
        'items': [
          {
            'label': "Tanks/enclosed spaces",
            'value': false,
          },
          {
            'label': "Hot work",
            'value': false,
          },
          {
            'label': "Working at heights",
            'value': false,
          },
          {
            'label': "Working overside/outboard",
            'value': false,
          },
          {
            'label': "Electrical circuits",
            'value': false,
          },
          {
            'label': "Dangerous substances",
            'value': false,
          },
          {
            'label': "Isolation of machinery",
            'value': false,
          },
          {
            'label': "Any lift",
            'value': false,
          },
          {
            'label': "Other dangerous operations",
            'value': false,
          },
        ]
      },
      {
        'key': 'checkbox1',
        'type': 'Checkbox',
        'label': 'Workplace',
        'items': [
          {
            'label': "Deck",
            'value': false,
          },
          {
            'label': "Hot work",
            'value': false,
          },
          {
            'label': "Working at heights",
            'value': false,
          },
          {
            'label': "Working overside/outboard",
            'value': false,
          },
          {
            'label': "Electrical circuits",
            'value': false,
          },
          {
            'label': "Dangerous substances",
            'value': false,
          },
          {
            'label': "Isolation of machinery",
            'value': false,
          },
          {
            'label': "Any lift",
            'value': false,
          },
          {
            'label': "Other dangerous operations",
            'value': false,
          },
        ]
      },
    ]
  };

  dynamic response;
  dynamic data;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      key: _scaffoldKeySendList,
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 147, 90),
        title: Text(
          widget.formStructure.name ?? "",
        ),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: new SingleChildScrollView(
        child: Container(
          child: new Center(
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.90,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0,
                  ),
                ],
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                color: Color.fromARGB(255, 245, 245, 245),
              ),
              child: new Column(children: <Widget>[
                FutureBuilder<Map<dynamic, dynamic>>(
                  future: _future,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return new JsonSchema(
                        formMap: snapshot.data,
                        onChanged: (dynamic response) {
                          this.response = response;
                          print(response);
                        },
                        actionSave: (dynamic data) async {
                          this.data = data;
                          var text = "   Sending form...";
                          var snack = new SnackBar(
                            content: new Row(
                              children: <Widget>[
                                new CircularProgressIndicator(),
                                new Text(text),
                              ],
                            ),
                            //duration: Duration(seconds: 2),
                          );
                          _scaffoldKeySendList.currentState.showSnackBar(snack);
                          tools
                              .sendFilledOutForm(data, widget.formStructure)
                              .then((val) {
                            if (val == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DashboardScreen(
                                            showSnackBar: true,
                                            message:
                                                "Your form was successfully sent.",
                                          )));
                            }
                          });
                        },
                        buttonSave: new Container(
                          height: 40.0,
                          color: Color.fromARGB(255, 190, 147, 90),
                          child: Center(
                            child: Text("Send",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      );
                    } else {
                      return Center(child: new CircularProgressIndicator());
                    }
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
