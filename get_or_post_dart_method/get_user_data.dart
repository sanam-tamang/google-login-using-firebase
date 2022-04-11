//get the user data from the servers
//dart:io for httpHeaders
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../data_models/user_info.dart';

//getting data from the database to the device
Future getUserDataFromDabase(String id) async {
  try {
    final queryParameters = {'id': id};
    final uri = Uri.https('sanamtamang.com.np',
        '/backend_practice_2.0/get_data.php', queryParameters);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      print("Sucess");
      print(response.body);
      var rawData = jsonDecode(response.body);
      print("--------------A-f-t-e-r--d-e-c-o-d-i-n-g-------------");
      UserData userDataFromDB = UserData.fromJson(rawData);
      //returnign UserData to the FutureBuilder
      return userDataFromDB;
    } else {
      //this kinds of thing is not suitable for the
      //real application
      //but just for the practice purpose I have implemented it
      throw Exception('Data is not found');
    }
  } catch (e) {
    //later this error should be modifitied according to the error may occur from the server
    throw Exception(e.toString());
  }
}
