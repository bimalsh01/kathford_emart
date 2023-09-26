class Users {
  String? firstName;
  String? lastName;
  String? email;
  String? username;

  Users({this.firstName, this.lastName, this.email, this.username});

  Users fromJson(Map<String, dynamic> json) {
    return Users(
      firstName: json['firsname'],
      lastName: json['lastname'],
      email: json['email'],
      username: json['username'],
    );
  }
}
