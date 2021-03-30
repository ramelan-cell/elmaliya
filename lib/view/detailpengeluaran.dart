import 'dart:convert';

import 'package:elmaliya/view/login.dart';
import 'package:flutter/material.dart';
import 'package:elmaliya/main.dart';
import 'package:elmaliya/model/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class DetailPengeluaran extends StatefulWidget {
  List list;
  int index;
  DetailPengeluaran({this.index, this.list});
  @override
  _DetailPengeluaranState createState() => _DetailPengeluaranState();
}

int statushc;
String idUsers;

class _DetailPengeluaranState extends State<DetailPengeluaran> {
  bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();
  final formatter = new NumberFormat("#,###,###");

  @override
  void initState() {
    if (this.mounted) {
      // TODO: implement initState
      super.initState();
    }
  }

  @override
  void dispose() {
    if (this.mounted) {
      super.dispose();
    }
  }

  // Alert dialog Confirm
  void deleteConfirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Hapus riwayat pencatatan ${widget.list[widget.index]['kategori']}?"),
      actions: <Widget>[
        new RaisedButton(
            child: new Text(
              "HAPUS",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () {}),
        new RaisedButton(
            child: new Text(
              "BATAL",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightGreen,
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    int nominal = int.parse(widget.list[widget.index]['nominal']);

    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: new Text(
          'Detail Data Pengeluaran',
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            new Container(
              child: Column(
                children: [
                  ListTile(
                    title: new Text('Tanggal buat'),
                    subtitle: new Text(DateFormat(
                          "d MMMM yyyy",
                        ).format(DateTime.parse(
                            widget.list[widget.index]['tanggal'])) ??
                        ''),
                  ),
                  Divider(),
                  ListTile(
                    title: new Text('Tipe pengeluaran'),
                    subtitle: new Text(
                        widget.list[widget.index]['tipe_pengeluaran'] ?? ''),
                  ),
                  Divider(),
                  ListTile(
                    title: new Text('Nominal (Rp)'),
                    subtitle: new Text(formatter.format(nominal)),
                  ),
                  Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
