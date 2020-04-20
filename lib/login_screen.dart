import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final uidController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 63, 90),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                child: Center(
                  child: Image(
                    image: AssetImage(
                      "assets/logo.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Divider(
                  color: Colors.white54,
                  thickness: 3,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          color: Colors.white70,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: TextField(
                              style: new TextStyle(fontSize: 30.0),
                              controller: uidController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          color: Colors.white70,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: TextField(
                              style: new TextStyle(fontSize: 30.0),
                              obscureText: true,
                              controller: pwdController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed("/DashboardScreen");
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                          color: Color.fromARGB(255, 190, 147, 90),
                          textColor: Colors.white,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, right: 30, left: 30),
                          child: Container(
                            padding: const EdgeInsets.all(6.0),
                            child: const Text("Login",
                                style: TextStyle(
                                  fontSize: 30,
                                )),
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
