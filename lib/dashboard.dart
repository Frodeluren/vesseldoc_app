import 'package:flutter/material.dart';
import 'package:vesseldoc_app/decortest.dart';
import 'package:vesseldoc_app/form_creator.dart';
import 'package:vesseldoc_app/form_fill.dart';
import 'package:vesseldoc_app/form_list_screen.dart';
import 'package:vesseldoc_app/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 147, 90),
        title: Text("Dashboard"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings, color: Colors.white), onPressed: (){
            
          },),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => FormCreatorScreen())),
                        child: Column(
                          children: <Widget>[
                            Text("Create new form",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            Image(
                              image: AssetImage(
                                "assets/createform.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => FormListScreen())),
                        child: Column(
                          children: <Widget>[
                            Text("Fill out form",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            Image(
                              image: AssetImage(
                                "assets/filloutform.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Center(
                    child: GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen())),
                      child: Column(
                        children: <Widget>[
                          Text("Sign",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          Image(
                            image: AssetImage(
                              "assets/sign.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
        // Expanded(
        //   child: Row(
        //     children: <Widget>[
        //       Container(
        //         width: MediaQuery.of(context).size.width * 0.45,
        //         child: Center(
        //           child: GestureDetector(
        //             onTap: () => Navigator.push(context,
        //                 MaterialPageRoute(builder: (_) => LoginScreen())),
        //             child: Column(
        //               children: <Widget>[
        //                 Text("Status",
        //                     style: TextStyle(
        //                       fontSize: 20,
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.bold,
        //                     )),
        //                 Image(
        //                   image: AssetImage(
        //                     "assets/status.png",
        //                   ),
        //                   fit: BoxFit.cover,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: MediaQuery.of(context).size.width * 0.45,
        //         child: Center(
        //           child: GestureDetector(
        //             onTap: () => Navigator.push(context,
        //                 MaterialPageRoute(builder: (_) => LoginScreen())),
        //             child: Column(
        //               children: <Widget>[
        //                 Text("Workers",
        //                     style: TextStyle(
        //                       fontSize: 20,
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.bold,
        //                     )),
        //                 Image(
        //                   image: AssetImage(
        //                     "assets/workers.png",
        //                   ),
        //                   fit: BoxFit.cover,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Expanded(
        //   child: Row(
        //     children: <Widget>[
        //       // Container(
        //       //   width: MediaQuery.of(context).size.width * 0.45,
        //       //   child: Center(
        //       //     child: GestureDetector(
        //       //       onTap: () => Navigator.push(context,
        //       //           MaterialPageRoute(builder: (_) => LoginScreen())),
        //       //       child: Column(
        //       //         children: <Widget>[
        //       //           Text("Sync",
        //       //               style: TextStyle(
        //       //                 fontSize: 20,
        //       //                 color: Colors.white,
        //       //                 fontWeight: FontWeight.bold,
        //       //               )),
        //       //           Image(
        //       //             image: AssetImage(
        //       //               "assets/sync.png",
        //       //             ),
        //       //             fit: BoxFit.cover,
        //       //           ),
        //       //         ],
        //       //       ),
        //       //     ),
        //       //   ),
        //       // ),

        //     ],
        //   ),
        // ),
        // Expanded(
        //   child: Row(
        //     children: <Widget>[
        //       Container(
        //         width: MediaQuery.of(context).size.width * 0.45,
        //         child: Center(
        //           child: GestureDetector(
        //             onTap: () => Navigator.push(context,
        //                 MaterialPageRoute(builder: (_) => LoginScreen())),
        //             child: Column(
        //               children: <Widget>[
        //                 Text("Settings",
        //                     style: TextStyle(
        //                       fontSize: 20,
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.bold,
        //                     )),
        //                 Image(
        //                   image: AssetImage(
        //                     "assets/settings.png",
        //                   ),
        //                   fit: BoxFit.cover,
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
