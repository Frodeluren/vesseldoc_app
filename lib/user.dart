class User {
  User(this.username);
  final String username;
  String role;
  String token;

  Map<String, dynamic> toJson() => {
        'username': username,
      };
}
