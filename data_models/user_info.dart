//get the user data from the server
//or database which is previously stored

class UserData {
  final String name;
  final String id;
  final String imageURL;
  final String email;
  UserData(
      {required this.id,
      required this.name,
      required this.email,
      required this.imageURL});

// converting json data in individual variables where
//we are getting data from the server
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        imageURL: json['photo']);
  }
}
