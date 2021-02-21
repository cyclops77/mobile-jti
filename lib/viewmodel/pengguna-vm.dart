import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_jti/core/server.dart';
import 'package:test_jti/model/pengguna-m.dart';

class PenggunaVM {
  static String url = Server.now;
  static String access = "Lumen-App debugging123";

  static Future getData() async {
    final response = await http.get(url + "pengguna", headers: {
      'Access-Control-Request-Headers': access,
    });
    try {
      var data = json.decode(response.body);
      final List<PenggunaModel> a = penggunaModelFromJson(data["data"]);
      return a;
    } on Exception catch (e) {
      return 'error' + e.toString();
    }
  }

  static Future store({String nama, kota, usia}) async {
    final response = await http.post(url + "pengguna/create", headers: {
      'Access-Control-Request-Headers': access,
    }, body: {
      'nama': nama,
      'usia': usia,
      'kota': kota,
    });
    var data = json.decode(response.body);
    print(data.toString());
    return 'ok';
  }
}
