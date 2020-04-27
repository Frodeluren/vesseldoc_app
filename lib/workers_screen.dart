import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vesseldoc_app/tools.dart';
import 'package:vesseldoc_app/user.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'add_user.dart';

class WorkersScreen extends StatefulWidget {
  @override
  _WorkersScreenState createState() => _WorkersScreenState();
}

class _WorkersScreenState extends State<WorkersScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  TabBar tabBar;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  String whichRole;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
      length: 2,
      vsync: this,
    );
    _future = tools.getListOfUsers();
  }

  List<Tab> myTabs = <Tab>[
    new Tab(text: "Active users"),
    new Tab(
      text: "Roles",
    )
  ];

  var tools = new Tools();
  Future<List<User>> _future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 147, 90),
        title: Text("Manage workers"),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
            ),
          ],
          borderRadius: new BorderRadius.all(
            new Radius.circular(10.0),
          ),
          color: Color.fromARGB(255, 225, 225, 225),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                      topLeft: new Radius.circular(10.0),
                      bottomLeft: new Radius.circular(10.0)),
                  color: Color.fromARGB(255, 225, 225, 225),
                ),
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        Text(
                          "Hello Admin",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          "Username",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          "Username",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          "Role",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          "Role",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              //width: MediaQuery.of(context).size.width * 0.65,
              decoration: new BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black,
                //     blurRadius: 10.0,
                //   ),
                // ],
                borderRadius: new BorderRadius.all(
                  new Radius.circular(10.0),
                ),
                color: Color.fromARGB(255, 245, 245, 245),
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(bottom: 20),
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(10.0)),
                              color: Colors.transparent),
                          child: new TabBar(
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                              labelColor: Colors.black,
                              indicatorColor: Color.fromARGB(255, 190, 147, 90),
                              controller: _controller,
                              tabs: myTabs),
                        ),
                        SizedBox(width: 50),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "List of Active Users",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: RaisedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Add User",
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        content: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.28,
                                          child: SingleChildScrollView(
                                            child: Column(children: <Widget>[
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Username",
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )),
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: TextField(
                                                    controller:
                                                        _usernameController,
                                                    decoration: InputDecoration(
                                                        hintText: "Username",
                                                        hintStyle: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12.0)),
                                                  )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Password",
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )),
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: TextField(
                                                    obscureText: true,
                                                    controller:
                                                        _passwordController,
                                                    decoration: InputDecoration(
                                                        hintText: "Password",
                                                        hintStyle: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 12.0)),
                                                  )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Role",
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down),
                                                  isExpanded: true,
                                                  hint: Text(
                                                    "Role",
                                                    style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  items: [
                                                    DropdownMenuItem(
                                                        value: "Deckcrew",
                                                        child: Text(
                                                          "Deckcrew",
                                                          style: GoogleFonts
                                                              .roboto(
                                                            textStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        )),
                                                    DropdownMenuItem(
                                                        value: "Machinecrew",
                                                        child: Text(
                                                          "Machinecrew",
                                                          style: GoogleFonts
                                                              .roboto(
                                                            textStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        )),
                                                    DropdownMenuItem(
                                                        value: "Supervisor",
                                                        child: Text(
                                                          "Supervisor",
                                                          style: GoogleFonts
                                                              .roboto(
                                                            textStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                  onChanged: (value) {
                                                    setState(() {
                                                      whichRole = value;
                                                    });
                                                  },
                                                  style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  value: whichRole,
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          MaterialButton(
                                            elevation: 5.0,
                                            child: Text("Cancel"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          MaterialButton(
                                            elevation: 5.0,
                                            child: Text("Add"),
                                            onPressed: () {},
                                          )
                                        ],
                                      );
                                    });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              color: Color.fromARGB(255, 190, 147, 90),
                              textColor: Colors.black,
                              padding: const EdgeInsets.only(
                                  top: 2, bottom: 2, right: 10, left: 20),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Add user",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.add)
                                ],
                              )),
                        ),
                      ],
                    ),
                    Divider(),
                    Expanded(
                      child: Container(
                        decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(10.0)),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: FutureBuilder<List<User>>(
                          future: _future,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width*0.5,
                                child: ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.09,
                                        child: Slidable(
                                          actionPane: SlidableBehindActionPane(),
                                          actionExtentRatio: 0.1,
                                          child: Container(
                                            color: Colors.white,
                                            child: ListTile(
                                              leading: CircleAvatar(
                                                backgroundColor:
                                                    Colors.indigoAccent,
                                                child: Text(''),
                                                foregroundColor: Colors.white,
                                              ),
                                              title: Text('Tile n°'),
                                              subtitle:
                                                  Text('SlidableDrawerDelegate'),
                                            ),
                                          ),
                                          actions: <Widget>[],
                                          secondaryActions: <Widget>[
                                            IconSlideAction(
                                              caption: 'More',
                                              color: Colors.black45,
                                              icon: Icons.more_horiz,
                                              onTap: () => {},
                                            ),
                                            IconSlideAction(
                                              caption: 'Delete',
                                              color: Colors.red,
                                              icon: Icons.delete,
                                              onTap: () => {},
                                            ),
                                          ],
                                        ),
                                        // child: Card(
                                        //   child: Container(
                                        //     padding: EdgeInsets.all(10),
                                        //     child: Row(
                                        //       children: <Widget>[
                                        //         Column(
                                        //           crossAxisAlignment:
                                        //               CrossAxisAlignment.start,
                                        //           children: <Widget>[
                                        //             Text(
                                        //               "Username",
                                        //               style: GoogleFonts.roboto(
                                        //                 textStyle: TextStyle(
                                        //                     color: Colors.grey,
                                        //                     fontSize: 14,
                                        //                     fontWeight: FontWeight
                                        //                         .normal),
                                        //               ),
                                        //             ),
                                        //             SizedBox(
                                        //               height: 5,
                                        //             ),
                                        //             Text(snapshot
                                        //                 .data[index].username),
                                        //           ],
                                        //         ),
                                        //         SizedBox(
                                        //           width: 100,
                                        //         ),
                                        //         Column(
                                        //           crossAxisAlignment:
                                        //               CrossAxisAlignment.start,
                                        //           children: <Widget>[
                                        //             Text(
                                        //               "Role",
                                        //               style: GoogleFonts.roboto(
                                        //                 textStyle: TextStyle(
                                        //                     color: Colors.grey,
                                        //                     fontSize: 14,
                                        //                     fontWeight: FontWeight
                                        //                         .normal),
                                        //               ),
                                        //             ),
                                        //             SizedBox(
                                        //               height: 5,
                                        //             ),
                                        //             Text(snapshot
                                        //                 .data[index].role),
                                        //           ],
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                      );
                                    }),
                              );
                            } else {
                              return Center(
                                  child: new CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
