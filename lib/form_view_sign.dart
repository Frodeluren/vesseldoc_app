import 'package:json_to_form/json_schema.dart';
import 'package:flutter/material.dart';
import 'package:vesseldoc_app/filled_form.dart';
import 'package:vesseldoc_app/tools.dart';

class FormSignSpecificScreen extends StatefulWidget {
  @override
  _FormSignSpecificScreenState createState() => _FormSignSpecificScreenState();

  FilledForm filledForm;
  FormSignSpecificScreen({this.filledForm});
}

class _FormSignSpecificScreenState extends State<FormSignSpecificScreen> {
  @override
  void initState() {
    super.initState();
    _future = tools.getWantedFilledForm(widget.filledForm);
  }

  final GlobalKey<ScaffoldState> _scaffoldKeySendList =
      new GlobalKey<ScaffoldState>();
  var tools = Tools();
  Future<Map> _future;

  dynamic response;
  dynamic data;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKeySendList,
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 147, 90),
        title: Text(
          widget.filledForm.name ?? "",
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
                      return Container(
                        child: Column(
                          children: <Widget>[
                            IgnorePointer(
                              child: new JsonSchema(
                                formMap: snapshot.data,
                                onChanged: (dynamic response) {
                                  this.response = response;
                                  print(response);
                                },
                                actionSave: (dynamic data) async {},
                              ),
                            ),
                            new Container(
                              height: 40.0,
                              color: Color.fromARGB(255, 190, 147, 90),
                              child: Center(
                                child: Text("Sign",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
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
