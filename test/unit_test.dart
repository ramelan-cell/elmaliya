import 'dart:convert';
import 'package:elmaliya/view/pemasukanlist.dart';
import 'package:elmaliya/model/api.dart';
import 'package:elmaliya/view/password.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';

String userid;

void main(List<String> args) {
  group("input income test", () {
    setUp(() {});

    test('Check list pemasukan', () async {
      var response = http.post(BaseUrl.getHistoryPemasukan[0]);

      // var json = PemasukanList.fromJson(inputJson);
      // expect(response.id == json.id, true);
      // expect(response.tanggal == json.tanggal, true);
      // expect(response.kategori == json.kategori, true);
      // expect(response.jenis_dana == json.jenis_dana, true);
      // expect(response.nominal == json.nominal, true);
    });
  });
}

const inputJson = {
  "id": 1,
  "tanggal": 2021 - 01 - 24,
  "kategori": "MTS",
  "jenis_dana": "PAS",
  "nominal": 500000
};
