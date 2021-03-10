import 'dart:ui';

import 'package:elmaliya/model/api.dart';
import 'package:elmaliya/view/password.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userid, username, namalengkap, nohp, alamat, foto, urlfoto;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (this.mounted) {
      setState(() {
        userid = preferences.getString("id");
      });
    }
  }

  Future<List> getData() async {
    if (userid == null) {
    } else {
      final response =
          await http.post(BaseUrl.getprofile, body: {"id": userid});
      return jsonDecode(response.body);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    if (this.mounted) {
      super.initState();
      getPref();
      getData();
    }
  }

  @override
  void dispose() {
    if (this.mounted) {
      // TODO: implement dispose
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                Container(
                    // height: 150,
                    // //SAMA HALNYA DENGAN CONTAINER SEBELUMNYA, WARNANYA DI-SET DAN BORDERRADIUSNYA KALI INI BERBEDA KITA SET KE-4 SISINYA AGAR MELENGKUNG
                    // decoration: BoxDecoration(
                    //   color: Colors.green,
                    //   borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(30),
                    //     bottomRight: Radius.circular(30),
                    //   ),
                    // ),
                    ),
                // Container(
                //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                //   child: DefaultTextStyle(
                //     style: TextStyle(
                //         fontSize: 12,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold),
                //     child: Column(
                //       children: <Widget>[
                //         Center(
                //           child: new Stack(children: <Widget>[
                //             Container(
                //                 width: 150.0,
                //                 height: 150.0,
                //                 decoration: new BoxDecoration(
                //                     shape: BoxShape.circle,
                //                     image: new DecorationImage(
                //                         fit: BoxFit.cover,
                //                         image: new AssetImage(
                //                             'gambar/profile.png')))),
                //           ]),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new FutureBuilder<List>(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? new ItemList(
                              list: snapshot.data,
                            )
                          : new Center(
                              child: new CircularProgressIndicator(),
                            );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  final formatter = new NumberFormat("#,###,###,###,###");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Report bulan ini',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Total Pemasukan bulan ini',
                          ),
                        ),
                        Container(
                          child: Text(
                            'Rp ' +
                                formatter.format(int.parse(
                                    list[i]['total_pemasukan'] ?? '0')),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Total Pengeluaran bulan ini',
                          ),
                        ),
                        Container(
                          child: Text(
                              'Rp ' +
                                  formatter.format(int.parse(
                                      list[i]['total_pengeluaran'] ?? '0')),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange)),
                        )
                      ],
                    ),
                    Divider(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Saldo bulan ini',
                          ),
                        ),
                        Container(
                          child: Text(
                              'Rp ' +
                                  formatter.format(
                                      int.parse(list[i]['saldo'] ?? '0')),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange)),
                        )
                      ],
                    ),
                    Divider(
                      height: 30.0,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Container(
                    //       child: Text(
                    //         'Data Pribadi',
                    //         style: TextStyle(fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Divider(
                    //   height: 30.0,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Container(
                    //       child: Text(
                    //         'Nama lengkap',
                    //       ),
                    //     ),
                    //     Container(
                    //       child: Text(list[i]['nama_lengkap'] ?? '',
                    //           style: TextStyle(fontWeight: FontWeight.bold)),
                    //     )
                    //   ],
                    // ),
                    // Divider(
                    //   height: 30.0,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Container(
                    //       child: Text('No Handphone'),
                    //     ),
                    //     Container(
                    //       child: Text(list[i]['no_hp'] ?? '',
                    //           style: TextStyle(fontWeight: FontWeight.bold)),
                    //     )
                    //   ],
                    // ),
                    // Divider(
                    //   height: 30.0,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Container(
                    //       child: Text('Alamat'),
                    //     ),
                    //     Container(
                    //       child: Text(list[i]['alamat'] ?? '',
                    //           style: TextStyle(fontWeight: FontWeight.bold)),
                    //     )
                    //   ],
                    // ),
                    // Divider(
                    //   height: 30.0,
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new Password()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Ganti Password',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(child: Icon(Icons.keyboard_arrow_right))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
