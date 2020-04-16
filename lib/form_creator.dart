import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class FormCreatorScreen extends StatefulWidget {
  @override
  _FormCreatorScreenState createState() => _FormCreatorScreenState();
}

class _FormCreatorScreenState extends State<FormCreatorScreen> {
  String _value;
  bool isPhotoAttached = false;

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
                          // Text("FORM CREATOR",
                          //     style: GoogleFonts.roboto(
                          //       textStyle: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 48,
                          //       ),
                          //     )),
                          // SizedBox(
                          //     width: MediaQuery.of(context).size.width * 0.03),
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
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
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
                              Text(
                                  "Please select which type of checkpoint you want",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(height: 15),
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
                                      "Select",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                          value: "1", child: Text("Text")),
                                      DropdownMenuItem(
                                          value: "2",
                                          child: Text("Checkpoint")),
                                      DropdownMenuItem(
                                          value: "3", child: Text("Slider"))
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    },
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    value: _value,
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
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8.0),
                                  hintText: "Text of this checkpoint",
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
                                        Navigator.of(context)
                                            .pushNamed("/DashboardScreen");
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
                                        Navigator.of(context)
                                            .pushNamed("/DashboardScreen");
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
                          child: DataTable(
                            columns: [
                              DataColumn(
                                  label: Text(
                                "Checkpoints",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              DataColumn(
                                label: Text(
                                  "Type",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(
                                    Text("1. What are the danger categories?")),
                                DataCell(Text("Text")),
                              ]),
                              DataRow(cells: [
                                DataCell(Text("2. How is that?")),
                                DataCell(Text("Switch")),
                              ])
                            ],
                          ),
                          height: MediaQuery.of(context).size.height * 0.63,
                          width: MediaQuery.of(context).size.width * 0.58,
                          //color: Color.fromARGB(255, 200, 200, 200),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
