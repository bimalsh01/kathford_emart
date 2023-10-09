class Users {
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? phoneNumber;
  String? profileImage;

  Users({
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.phoneNumber,
    this.profileImage,
  });

  Users fromJson(Map<String, dynamic> json) {
    return Users(
      firstName: json['firsname'],
      lastName: json['lastname'],
      email: json['email'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firsname': firstName,
      'lastname': lastName,
      'username': username,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
    };
  }
}
