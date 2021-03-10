import 'package:elmaliya/view/home.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:elmaliya/model/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class Pemasukan extends StatefulWidget {
  @override
  _PemasukanState createState() => _PemasukanState();
}

class _PemasukanState extends State<Pemasukan> {
  final snackbarKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();
  final _key = new GlobalKey<FormState>();

  void _snackbar(String str) {
    if (str.isEmpty) return;
    _scaffoldState.currentState.showSnackBar(new SnackBar(
      backgroundColor: Colors.green,
      content: new Text(str,
          style: new TextStyle(fontSize: 15.0, color: Colors.white)),
      duration: new Duration(seconds: 5),
    ));
  }

  bool _isLoading = false;
  DateTime tanggal;
  String kategori;
  String jenisdana;
  String nominal;
  TextEditingController txtnominal = TextEditingController();
  TextEditingController txtjenisdana = TextEditingController();

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString("id");
    });
  }

  check() {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
    }
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      if (tanggal == null) {
        _snackbar('Tanggal wajib diisi !');
        setState(() {
          _isLoading = false;
        });
      } else if (jenisdana == null) {
        _snackbar('Kolom Jenis dana wajib disi !');
        setState(() {
          _isLoading = false;
        });
      } else if (kategori == null) {
        _snackbar('Kolom kategori wajib disi');
        setState(() {
          _isLoading = false;
        });
      } else if (nominal == null) {
        _snackbar('Kolom nominal wajib disi');
        setState(() {
          _isLoading = false;
        });
      } else {
        prosessimpan();
      }
    }
  }

  prosessimpan() async {
    final response = await http.post(BaseUrl.inputpemasukan, body: {
      "user_id": userid,
      "tanggal": tanggal.toString(),
      "jenis_dana": jenisdana,
      "kategori": kategori,
      "nominal": nominal
    });

    final data = jsonDecode(response.body);
    print(data);

    String message = data['message'];
    _snackbar(message);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text(
          'Input Pemasukan',
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _key,
            child: ListView(
              children: <Widget>[
                DateTimePickerFormField(
                  style: TextStyle(fontSize: 13.0, color: Colors.black),
                  inputType: InputType.date,
                  format: DateFormat("yyyy-MM-dd"),
                  initialDate: DateTime.now(),
                  editable: false,
                  decoration: InputDecoration(
                    labelText: 'Tanggal',
                    labelStyle: TextStyle(fontSize: 13.0, color: Colors.blue),
                  ),
                  onChanged: (dt) {
                    setState(() => tanggal = dt);
                    print(tanggal);
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                DropdownButton<String>(
                  itemHeight: 100.0,
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('MTS'),
                      value: 'MTS',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('SMP'),
                      value: 'SMP',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('SMA'),
                      value: 'SMA',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('SMK'),
                      value: 'SMK',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('MMA'),
                      value: 'MMA',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('MA'),
                      value: 'MA',
                    ),
                  ],
                  onChanged: (String value) {
                    setState(() {
                      kategori = value;
                      print(kategori);
                    });
                  },
                  hint: Text('kategori'),
                  value: kategori,
                ),
                SizedBox(
                  height: 5.0,
                ),
                DropdownButton<String>(
                  itemHeight: 100.0,
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('PAS'),
                      value: 'PAS',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('SPP'),
                      value: 'SPP',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('PTS'),
                      value: 'PTS',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Dana Pembangunan'),
                      value: 'DANA PEMBANGUNAN',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Ekstrakulikuler'),
                      value: 'EKSTRAKULIKULER',
                    ),
                  ],
                  onChanged: (String value) {
                    setState(() {
                      jenisdana = value;
                      print(jenisdana);
                    });
                  },
                  hint: Text('Jenis Dana'),
                  value: jenisdana,
                ),
                TextFormField(
                  controller: txtnominal,
                  onSaved: (e) => nominal = e,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Masukan nominal'),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      check();
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green[900]),
                      child: Center(
                        child: _isLoading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                "Proses",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
