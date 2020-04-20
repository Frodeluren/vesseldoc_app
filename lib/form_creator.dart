import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class FormCreatorScreen extends StatefulWidget {
  @override
  _FormCreatorScreenState createState() => _FormCreatorScreenState();
}

class _FormCreatorScreenState extends State<FormCreatorScreen> {
  String accessValue;
  String fieldType;
  final fieldTextController = TextEditingController();
  final titleTextController = TextEditingController();
  int numberOfFields = 0;

  bool isPhotoAttached = false;

  List<DataRow> datatableRows = new List<DataRow>();
  List<Widget> itemsInDataTable = new List<Widget>();

  void addRowToDatatable() {
    setState(() {
      if (fieldType != "" &&
          fieldTextController.text != "" &&
          fieldTextController.text.length < 120) {
        String photoAttached;
        if (isPhotoAttached == true) {
          photoAttached = "Yes";
        } else {
          photoAttached = "No";
        }
        numberOfFields++;
        datatableRows.add(DataRow(cells: [
          DataCell(Text(
              numberOfFields.toString() + ". " + fieldTextController.text)),
          DataCell(Text(fieldType)),
          DataCell(Text(photoAttached)),
        ]));
      }
    });
  }

  var random = new Random();

  void addItemToDatatable() {
    var currentWidget;
    setState(() {
      if (fieldType != "" &&
          fieldTextController.text != "" &&
          fieldTextController.text.length < 120) {
        String photoAttached;
        if (isPhotoAttached == true) {
          photoAttached = "Yes";
        } else {
          photoAttached = "No";
        }
        numberOfFields++;
        String key = random.nextInt(1000).toString();
        Widget w = new Dismissible(
          onDismissed: (dir) {
            deleteFromDatatable(currentWidget);
          },
          key: Key(key),
          child: Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                    child: Center(
                      child: Text(
                        fieldTextController.text,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                    child: Center(
                      child: Text(
                        fieldType,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                    child: Center(
                      child: Text(
                        photoAttached,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        itemsInDataTable.add(w);
        currentWidget = w;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 147, 90),
        title: Text("Form Creator"),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.97,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10.0,
                                ),
                              ],
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(10.0)),
                              color: Color.fromARGB(255, 225, 225, 225),
                            ),
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Title:",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 35),
                                    Expanded(
                                      child: TextField(
                                        controller: titleTextController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(8.0),
                                          hintText: "Title for this checklist",
                                          hintStyle: TextStyle(),
                                          focusColor:
                                              Color.fromARGB(255, 190, 147, 90),
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 190, 147, 90),
                                                width: 3.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Access:",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          border: new Border.all(
                                              color: Colors.black45)),
                                      padding:
                                          EdgeInsets.only(right: 7, left: 7),
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          isExpanded: true,
                                          hint: Text("Select access lvl"),
                                          items: [
                                            DropdownMenuItem(
                                                value: "1",
                                                child: Text("Deckcrew")),
                                            DropdownMenuItem(
                                                value: "2",
                                                child: Text("Machinecrew")),
                                            DropdownMenuItem(
                                                value: "3",
                                                child: Text("Supervisors")),
                                            DropdownMenuItem(
                                                value: "4", child: Text("All"))
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              accessValue = value;
                                            });
                                          },
                                          value: accessValue,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    new Spacer(),
                                    RaisedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed("/DashboardScreen");
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    20.0)),
                                        color:
                                            Color.fromARGB(255, 190, 147, 90),
                                        textColor: Colors.black,
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            bottom: 2,
                                            right: 10,
                                            left: 20),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              "Discard list",
                                              style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Icon(Icons.delete_forever)
                                          ],
                                        )),
                                    SizedBox(width: 20),
                                    RaisedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed("/DashboardScreen");
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    20.0)),
                                        color:
                                            Color.fromARGB(255, 190, 147, 90),
                                        textColor: Colors.black,
                                        padding: const EdgeInsets.only(
                                            top: 2,
                                            bottom: 2,
                                            right: 10,
                                            left: 20),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              "Save list",
                                              style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Icon(Icons.save)
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.95,
                            //color: Color.fromARGB(255, 200, 200, 200),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 25),
                      child: Container(
                        decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10.0,
                            ),
                          ],
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(10.0)),
                          color: Color.fromARGB(255, 225, 225, 225),
                        ),
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Fieldttype",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.only(left: 7, right: 7),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                    border:
                                        new Border.all(color: Colors.black45)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    isExpanded: true,
                                    hint: Text(
                                      "Select wanted fieldtype",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                          value: "Header",
                                          child: Text("Header")),
                                      DropdownMenuItem(
                                          value: "Checkbox",
                                          child: Text("Checkbox")),
                                      DropdownMenuItem(
                                          value: "Slider",
                                          child: Text("Slider")),
                                      DropdownMenuItem(
                                          value: "Textinput",
                                          child: Text("Textinput"))
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        fieldType = value;
                                      });
                                    },
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    value: fieldType,
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text("Text",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                controller: fieldTextController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8.0),
                                  hintText: "Give text to the field",
                                  hintStyle: TextStyle(),
                                  focusColor: Color.fromARGB(255, 190, 147, 90),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 190, 147, 90),
                                        width: 3.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.photo_camera,
                                    size: 40,
                                  ),
                                  Text(
                                    "Photo attached?",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Switch(
                                      activeColor:
                                          Color.fromARGB(255, 190, 147, 90),
                                      value: isPhotoAttached,
                                      onChanged: (bool value) {
                                        setState(() {
                                          isPhotoAttached = value;
                                        });
                                      }),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  RaisedButton(
                                      onPressed: () {
                                        setState(() {
                                          fieldTextController.text = "";
                                          fieldType = null;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(20.0)),
                                      color: Color.fromARGB(255, 190, 147, 90),
                                      textColor: Colors.black,
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          right: 10,
                                          left: 20),
                                      child: Row(
                                        children: <Widget>[
                                          Text("Clear",
                                              style: TextStyle(
                                                fontSize: 20,
                                              )),
                                          SizedBox(width: 10),
                                          Icon(Icons.clear)
                                        ],
                                      )),
                                  SizedBox(width: 10),
                                  RaisedButton(
                                      onPressed: () {
                                        addItemToDatatable();
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(20.0)),
                                      color: Color.fromARGB(255, 190, 147, 90),
                                      textColor: Colors.black,
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          right: 10,
                                          left: 20),
                                      child: Row(
                                        children: <Widget>[
                                          Text("Add",
                                              style: TextStyle(
                                                fontSize: 20,
                                              )),
                                          SizedBox(width: 10),
                                          Icon(Icons.add)
                                        ],
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 25),
                      child: Container(
                        decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10.0,
                            ),
                          ],
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(10.0)),
                          color: Color.fromARGB(255, 225, 225, 225),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 190, 147, 90),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 3.0,
                                      spreadRadius: 1.5,
                                    ),
                                  ]),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            "Field",
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            "Type",
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            "Photo attached",
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: ReorderableListView(
                                    children: itemsInDataTable,
                                    onReorder: (oldIndex, newIndex) {
                                      if (newIndex > oldIndex) {
                                        newIndex -= 1;
                                      }
                                      Future.delayed(
                                          Duration(milliseconds: 100), () {
                                        setState(() {
                                          final item = itemsInDataTable
                                              .removeAt(oldIndex);

                                          itemsInDataTable.insert(
                                              newIndex, item);
                                        });
                                      });
                                    }),
                              ),
                            )
                          ],
                        ),

                        // child: DataTable(columns: [
                        //   DataColumn(
                        //       label: Text(
                        //     "Field",
                        //     style: GoogleFonts.roboto(
                        //       textStyle: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   )),
                        //   DataColumn(
                        //     label: Text(
                        //       "Type",
                        //       style: GoogleFonts.roboto(
                        //         textStyle: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //   ),
                        //   DataColumn(
                        //     label: Text(
                        //       "Photo",
                        //       style: GoogleFonts.roboto(
                        //         textStyle: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //     ),
                        //   )
                        // ], rows: datatableRows),
                      ),
                      height: MediaQuery.of(context).size.height * 0.63,
                      width: MediaQuery.of(context).size.width * 0.58,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void moveItemInList(int oldIndex, int newIndex) {
    final item = itemsInDataTable.removeAt(oldIndex);

    itemsInDataTable.insert(newIndex, item);
  }

  void deleteFromDatatable(Widget item) {
    itemsInDataTable.remove(item);
  }
}
