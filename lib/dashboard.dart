import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vesseldoc_app/form_creator.dart';
import 'package:vesseldoc_app/form_list_screen.dart';
import 'package:vesseldoc_app/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget dashBoard() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FormCreatorScreen())),
                          child: menuItem("Create new form",
                              "assets/createnewform.jpg", 0XFFBF935A, 2),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.01),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FormListScreen())),
                          child: menuItem("Fill out form",
                              "assets/filloutform2.png", 0XFFBF935A, 2),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.01),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginScreen())),
                          child: menuItem(
                              "Sign", "assets/sign2.png", 0XFFBF935A, 2),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.01),
                      Expanded(
                        child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen())),
                            child: menuItem("Workers", "assets/workers2.png",
                                0XFFBF935A, 2)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FormCreatorScreen())),
                          child: menuItem("Create new form",
                              "assets/createnewform.jpg", 0XFFBF935A, 2),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => FormListScreen())),
                          child: menuItem("Fill out form",
                              "assets/filloutform2.png", 0XFFBF935A, 2),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginScreen())),
                          child: menuItem(
                              "Sign", "assets/sign2.png", 0XFFBF935A, 2),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      Expanded(
                        child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen())),
                            child: menuItem("Workers", "assets/workers2.png",
                                0XFFBF935A, 2)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget menuItem(
      String itemName, String itemImage, int firstColor, int secondColor) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          gradient: new LinearGradient(
              colors: [Color(firstColor).withOpacity(0.6), Color(secondColor)],
              begin: Alignment.centerLeft,
              end: new Alignment(1, 1))),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(
                  new Radius.circular(10.0),
                ),
                image: DecorationImage(
                    image: new AssetImage(itemImage), fit: BoxFit.cover),
              ),
            ),
          ),
          Center(
            child: Text(
              itemName,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 147, 90),
        title: Text("Dashboard"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: dashBoard(),
    );
  }
}
