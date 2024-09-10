class User {
  int? id;
  String username;
  String password;

  User({
    this.id,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'username': username,
        'password': password,
      };

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'],
        username: data['username'],
        password: data['password'],
      );
}
