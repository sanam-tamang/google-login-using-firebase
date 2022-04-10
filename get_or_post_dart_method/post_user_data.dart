//post the user data into the servers

import 'package:http/http.dart' as http;

import '../data_models/user_data_model.dart';

//the User result is from google

Future postUserData() async {
  var _body = {
    'id': UserModel.id,
    'name': UserModel.name,
    'email': UserModel.email,
    'photo': UserModel.photo,
  };

  final response = await http.post(
      Uri.parse('https://sanamtamang.com.np/backend_practice_2.0/post.php'),
      headers: {},
      body: _body);

  if (response.statusCode == 200) {
    print("Sucess");
    print(response.body);
  } else {
    print("Error ${response.statusCode}");
  }
}
