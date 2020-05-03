import 'package:google_fonts/google_fonts.dart';
import 'package:json_to_form/json_schema.dart';
import 'package:flutter/material.dart';
import 'package:vesseldoc_app/filled_form.dart';
import 'package:vesseldoc_app/tools.dart';

class FormDetailsWorkerScreen extends StatefulWidget {
  @override
  _FormWorkerDetailsScreenState createState() => _FormWorkerDetailsScreenState();

  FilledForm filledForm;
  FormDetailsWorkerScreen({this.filledForm});
}

class _FormWorkerDetailsScreenState extends State<FormDetailsWorkerScreen> {
  @override
  void initState() {
    super.initState();
    _future = tools.getWantedFilledForm(widget.filledForm);
  }

  final GlobalKey<ScaffoldState> _scaffoldKeySendList =
      new GlobalKey<ScaffoldState>();
  var tools = Tools();
  Future<Map> _future;

    Widget getIcon(bool isSigned) {
    if (isSigned == true) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.clear,
        color: Colors.red,
      );
    }
  }

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
          "Form details",
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
                            Container(child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.64,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Name",
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(widget.filledForm.name),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.26,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Timestamp",
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(widget.filledForm.dateTime),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Signed",
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        getIcon(widget.filledForm.isSigned)
                                      ],
                                    ),
                                  ])),),
                                  Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.64,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "ID",
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(widget.filledForm.id),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.26,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "Signed by",
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(widget.filledForm.signedBy),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ])),
                                  Divider(),
                            IgnorePointer(
                              child: new JsonSchema(
                                color: Colors.grey,
                                formMap: snapshot.data,
                                onChanged: (dynamic response) {
                                  this.response = response;
                                  print(response);
                                },
                                actionSave: (dynamic data) async {},
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
