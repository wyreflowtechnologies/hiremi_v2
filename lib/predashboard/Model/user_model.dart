import 'dart:convert';

class User {
  final String name;
  final String fathersName;
  final String gender;
  final DateTime dateOfBirth;
  final String state;
  final String email;
  final String phoneNumber;
  final String whatsAppNumber;
  final String collegeName;
  final String branch;
  final String course;
  final String year;
  final String password;

  User({
    this.name = "",
    this.fathersName = "",
    this.gender = "",
    DateTime? dateOfBirth, // Make this parameter nullable
    this.state = "",
    this.email = "",
    this.phoneNumber = "",
    this.whatsAppNumber="",
    this.collegeName = "",
    this.branch = "",
    this.course = "",
    this.year = "",
    this.password = "",
  }) : dateOfBirth = dateOfBirth ?? DateTime(1970, 1, 1); // Use a fallback value

  User copyWith({
    String? name,
    String? fathersName,
    String? gender,
    DateTime? dateOfBirth,
    String? state,
    String? email,
    String? phoneNumber,
    String? whatsAppNumber,
    String? collegeName,
    String? branch,
    String? course,
    String? year,
    String? password,
  }) {
    return User(
      name: name ?? this.name,
      fathersName: fathersName ?? this.fathersName,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      state: state ?? this.state,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      whatsAppNumber: whatsAppNumber ?? this.whatsAppNumber,
      collegeName: collegeName ?? this.collegeName,
      branch: branch ?? this.branch,
      course: course ?? this.course,
      year: year ?? this.year,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'fathersName': fathersName,
      'gender': gender,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'state': state,
      'email': email,
      'phoneNumber': phoneNumber,
      'collegeName': collegeName,
      'branch': branch,
      'course': course,
      'year': year,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String? ?? "",
      fathersName: map['fathersName'] as String? ?? "",
      gender: map['gender'] as String? ?? "",
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'] as String)
          : DateTime(1970, 1, 1),
      state: map['state'] as String? ?? "",
      email: map['email'] as String? ?? "",
      phoneNumber: map['phoneNumber'] as String? ?? "",
      collegeName: map['collegeName'] as String? ?? "",
      branch: map['branch'] as String? ?? "",
      course: map['course'] as String? ?? "",
      year: map['year'] as String? ?? "",
      password: map['password'] as String? ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, fathersName: $fathersName, gender: $gender, dateOfBirth: $dateOfBirth, state: $state, email: $email, phoneNumber: $phoneNumber, collegeName: $collegeName, branch: $branch, course: $course, year: $year, password: $password)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.fathersName == fathersName &&
        other.gender == gender &&
        other.dateOfBirth == dateOfBirth &&
        other.state == state &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.collegeName == collegeName &&
        other.branch == branch &&
        other.course == course &&
        other.year == year &&
        other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        fathersName.hashCode ^
        gender.hashCode ^
        dateOfBirth.hashCode ^
        state.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        collegeName.hashCode ^
        branch.hashCode ^
        course.hashCode ^
        year.hashCode ^
        password.hashCode;
  }
}
