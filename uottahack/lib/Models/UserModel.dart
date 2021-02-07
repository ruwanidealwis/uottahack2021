class UserModel {
  final String name;
  final String email;
  final String UID;

  UserModel({this.name, this.email, this.UID});

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'UID': UID,
      };
}
