import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
              image: new AssetImage("assets/splashscreenbackground.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.58),
                  height: 55,
                  width: 250,
                  child: Text(
                    "Welcome to",
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 46.0,
                        letterSpacing: .6,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Text(
                  "Vesseldoc",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 66.0,
                      letterSpacing: .6,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 20.0),
                Container(
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/LoginScreen");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                      color: Color.fromARGB(255, 190, 147, 90),
                      textColor: Colors.white,
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 50, left: 50),
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        child: const Text("Get started!",
                            style: TextStyle(
                              fontSize: 30,
                            )),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
