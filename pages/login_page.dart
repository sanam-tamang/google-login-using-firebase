import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_models/sign_in.dart';
import '../data_models/user_info.dart';
import '../get_or_post_dart_method/post_user_data.dart';
import 'home_page.dart';

//this shows the login screen to the user
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late UserData user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

//****************************************************************** */
//sign up with google button
  Widget _signInButton() {
    return MaterialButton(
      splashColor: Color.fromRGBO(158, 158, 158, 1),
      onPressed: () {
        //result is being get by login_page.dart
        //signInWithGoogle function where it returns the user
        signInWithGoogle().then((result) async {
          if (result != null) {
            //calling future fuction
            //to store resulted data into the database
            //yaha await keyword kina lageko vanda aba post method
            //get method sakera matra home screen ma hamile content show garnu parney honi tw
            //tesaile yesto gareko ho

            await postUserData();

            //initialializing sharedpreference
            SharedPreferences _preferences =
                await SharedPreferences.getInstance();
            //pushing data to the system
            await _preferences.setString('userID', result.uid);

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  //after clicking the button it direct through the HomePage()
                  return HomePage();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      // borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
