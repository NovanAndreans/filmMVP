import 'dart:convert';

import 'package:coba_mvp/models/CobaModel.dart';
import 'package:coba_mvp/views/tambahFilm.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CobaService {
  static const String url = "http://10.21.1.209/laravel/film/api/film";
  Future<List<Coba>> loadData() async {                                          // Model [Coba]
    Response response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body)['data'];                             // label JSON [data]
    List<Coba> coba = [];
    for (var item in data) {
      coba.add(Coba.fromJson(item));
    }
    return coba;
  }

  Future<Map> editFilm(String id, String? title, String? cover,
      String? synop) async {
    Map<String, String> data = {};
    if (title != null) {
      data['product_name'] = title;
    }
    if (cover != null) {
      data['product_price'] = cover;
    }
    if (synop != null) {
      data['product_description'] = synop;
    }

    var response = await http.put(Uri.parse("http://10.21.1.209/laravel/film/api/film/" + id));
    return jsonDecode(response.body);
  }

  Future save(String title, String synop, String cover) async {
    final response = await http
        .post(Uri.parse("http://10.21.1.209/laravel/film/api/film"), body: {
      "film_title": title,
      "film_syn": synop,
      "film_cover": cover,
    });
    return jsonDecode(response.body);
  }

  Future<Coba> findProduct(id) async {
    var request = await http.get(Uri.parse("http://10.21.1.209/laravel/film/api/film/${id}"));
    var tes = "http://10.21.1.209/laravel/film/api/film/${id}";
    print(tes);
    Map<String, dynamic> result = jsonDecode(request.body)['data'];
 
    return Coba.fromJson(result);
  }

  Future<String> deleteFilm(String id) async {
    var response = await http.delete(Uri.parse("http://10.21.1.209/laravel/film/api/film/" + id));
    var data = jsonDecode(response.body);
    return data["message"] ?? "";
  }

}
