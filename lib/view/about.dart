import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.greenGrey,
      body: Stack(
        children: [
          // Container(
          //   height: 150,
          //   //SAMA HALNYA DENGAN CONTAINER SEBELUMNYA, WARNANYA DI-SET DAN BORDERRADIUSNYA KALI INI BERBEDA KITA SET KE-4 SISINYA AGAR MELENGKUNG
          //   decoration: BoxDecoration(
          //     color: Colors.green,
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(30),
          //       bottomRight: Radius.circular(30),
          //     ),
          //   ),
          // ),
          new Center(
            child: ListView(
              children: <Widget>[
                new SizedBox(
                  height: 150.0,
                ),
                new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "gambar/logo.png",
                        width: 150,
                        height: 100,
                      ),
                      new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                      new Text(
                        "Buku Kuangan Digital",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      new Text(
                        " versi 0.2",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      new Text(
                        "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ), //
                      new Text(
                        "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
