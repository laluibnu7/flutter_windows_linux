// FLUTTER 36. HTTP Request / Koneksi ke API (Post Method)
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String job;
  String created;

  // membuat Constructor, dimana nanti yang dimasukkan parameternya itu langsung dimasukkan ke dalam id
  PostResult({this.id, this.name, this.created, this.job});

  // membuat Factory Method => membuat object dari postResult
  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        created: object['createdAt']);
  }

  // Method untuk menghubungkan API ke aplikasi
  static Future<PostResult> connectToAPI(String name, String job) async {
    String apiURL = "https://reqres.in/api/users";

    var apiResult = await http.post(apiURL, body: {"name": name, "job": job});
    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
