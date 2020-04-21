import 'dart:convert';
import 'package:json_to_form/json_schema.dart';
import 'package:flutter/material.dart';

class FormFillerScreen extends StatefulWidget {
  @override
  _FormFillerScreenState createState() => _FormFillerScreenState();

  String title;
  FormFillerScreen({this.title});
}

class _FormFillerScreenState extends State<FormFillerScreen> {
  @override
  void initState() {
    super.initState();
  }

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
        'items': [

        ]
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 147, 90),
        title: Text(
          widget.title ?? "",
        ),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: new SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 30, 63, 90),
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
                // new Container(
                //   child: new Text(
                //     "S2: Work Permit",
                //     style: TextStyle(
                //         fontSize: 30.0,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.black),
                //   ),
                //   margin: EdgeInsets.only(top: 10.0),
                // ),
                new JsonSchema(
                  formMap: form,
                  onChanged: (dynamic response) {
                    this.response = response;
                    print(response);
                  },
                  actionSave: (dynamic data) {
                    this.data = data;
                    print(data);
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
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
