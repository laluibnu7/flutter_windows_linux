import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../model/ModelUSer.dart';
import 'package:http/http.dart' as http;

class BlocUser extends ChangeNotifier {
  //Prototype get list data from json
  List<ModelUser> _user;
  List<ModelUser> get listUser => _user;

  set idUser(int idUser) {}
  set listUser(List<ModelUser> val) {
    _user = val;
    notifyListeners();
  }

  //Connection to api webservice database
  Future<List<ModelUser>> fecthData() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users/');
    List myData = modelUserFromJson(response.body);
    print("MyData : " + myData.toString());
    listUser = myData;
    return listUser;
  }
}
