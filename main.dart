//signup through the google
import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

//userID for keeping the userData for another login time
//which we going to store it device
String? userID;
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SignUp through google",
      home: DecisionPage(),
    );
  }
}

//Decision Page
class DecisionPage extends StatefulWidget {
  const DecisionPage({Key? key}) : super(key: key);

  @override
  State<DecisionPage> createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  String? _userID;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _userID = await _preferences.getString('userID');
    userID = _userID;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //loginPage() or HomePage()
    //if _userID is null then return LoginPage othewise return HomePage()
    return _userID == null ? LoginPage() : HomePage();
  }
}
