// FLutter 37.  HTTP Request / Koneksi ke API (Get Method)
import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String name;
  String lastName;
  String mail;
  String vatar;

// constructor
  User({this.id, this.name, this.lastName, this.mail, this.vatar});

// Consturctor
  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name'],
        mail: object['email'],
        vatar: object['avatar']);
  }
  // Asyhnchronous
  static Future<User> connectToApi(String id) async {
    String apiURL = "https://reqres.in/api/users/" + id;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);
  }
}
