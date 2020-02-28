import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multicast_dns/multicast_dns.dart';
import './store_address_service.dart';

bool hasServer = false;
StoreAddressService sas = new StoreAddressService();

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

  _ServiceDiscovery sd = new _ServiceDiscovery();
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

class _ServiceDiscovery {
  _ServiceDiscovery() {
    discover();
  }

  ///Based on this example: https://pub.dev/packages/multicast_dns#-example-tab-
  Future<void> discover() async {
    while (!hasServer) {
      const String name = '_http._tcp.local';
      final MDnsClient client = MDnsClient();

      await client.start();

      await for (PtrResourceRecord ptr in client
          .lookup<PtrResourceRecord>(ResourceRecordQuery.serverPointer(name))) {
        await for (SrvResourceRecord srv in client.lookup<SrvResourceRecord>(
            ResourceRecordQuery.service(ptr.domainName))) {
          final String bundleId = ptr.domainName;

          if (bundleId == 'vesseldoc._http._tcp.local') {
            print("Found: ${srv.target}:${srv.port}");
            sas.writeAddress("${srv.target}:${srv.port}");
            hasServer = true;
          }
        }
      }
      client.stop();

      if (!hasServer) {
        print("Didn't find any vesseldoc servers. Retrying in 5 seconds.");
        sleep(const Duration(seconds: 5));
      }
    }
  }
}

