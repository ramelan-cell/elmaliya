import 'package:carousel_slider/carousel_options.dart';
import 'package:elmaliya/model/api.dart';
import 'package:elmaliya/view/pilihmenu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String userid, username, namalengkap = "", jabatan, nik, foto, urlfoto;

class _HomeState extends State<Home> {
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString("id");
      username = preferences.getString("username");
      namalengkap = preferences.getString("nama");
      // jabatan = preferences.getString("jabatan");
      // nik = preferences.getString("nik");
      // foto = preferences.getString("foto");
      // urlfoto = foto;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  static final List<String> imgSlider = ['1.jpg', '2.jpg', '3.jpg', '4.jpg'];
  final CarouselSlider autoPlayImage = CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
    ),
    items: imgSlider.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'gambar/slider' + '/${fileImage}',
            fit: BoxFit.fill,
          ),
        ),
      );
    }).toList(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Stack(
        children: [
          Container(
            height: 180,
            //SAMA HALNYA DENGAN CONTAINER SEBELUMNYA, WARNANYA DI-SET DAN BORDERRADIUSNYA KALI INI BERBEDA KITA SET KE-4 SISINYA AGAR MELENGKUNG
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Text(
                  'Selamat datang !  ' + namalengkap ?? '',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Row(
                  children: [],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              autoPlayImage,
              MenuUtama(),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: GridView.count(
        childAspectRatio: 4 / 3,
        shrinkWrap: true,
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Pilihmenu(
                          title: "pemasukan",
                        )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'gambar/pemasukan.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Text('Pemasukan')
                ],
              ),
            ),
          ),
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Pilihmenu(
                          title: "history_pemasukan",
                        )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'gambar/logo.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Text('Riwayat Pemasukan')
                ],
              ),
            ),
          ),
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Pilihmenu(
                          title: "pengeluaran",
                        )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'gambar/pengeluaran.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Text("Pengeluaran")
                ],
              ),
            ),
          ),
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Pilihmenu(
                          title: "history_pengeluaran",
                        )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'gambar/logo.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Text("Riwayat Pengeluaran")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
