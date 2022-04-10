import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import '../data_models/user_info.dart';
import '../get_or_post_dart_method/get_user_data.dart';

//after login to app successfully this homepage is shown
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("G0ogle login"),
        leading: const Text(""),
      ),
      body: FutureBuilder(
          future: getUserDataFromDabase(userID.toString()),
          builder: (BuildContext context, snapshot) {
            List<Widget> children = [];
            if (snapshot.hasData) {
              print(snapshot.data);
              children = [ShowUserData(user: snapshot.data as UserData)];
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              children = [Text("Wait for a sec...")];
            } else {
              children = [
                Text("Error occur: ${snapshot.error}"),
              ];
            }
            return SingleChildScrollView(child: Column(children: children));
          }),
    );
  }
}

class ShowUserData extends StatelessWidget {
  final UserData user;
  const ShowUserData({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
            backgroundImage: NetworkImage(
              '${user.imageURL}',
            ),
            radius: 150.0),
        Text('${user.name}'),
        Text('${user.email}'),
      ],
    );
  }
}
