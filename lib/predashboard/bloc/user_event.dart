part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class UpdatePage1 extends UserEvent {
  final String name;
  final String fathersName;
  final String gender;
  final DateTime dob;
  final String state;

   UpdatePage1({
    required this.name,
    required this.fathersName,
    required this.gender,
    required this.dob,
    required this.state,
  });
}

final class UpdatePage2 extends UserEvent {
  final String email;
  final String phoneNumber;

  UpdatePage2({required this.email, required this.phoneNumber});

}

final class UpdatePage3 extends UserEvent {
  final String collegeName;
  final String branch;
  final String course;
  final String year;

  UpdatePage3({required this.collegeName, required this.branch, required this.course, required this.year});
  
}

final class UpdatePage4 extends UserEvent {
  final String password;

  UpdatePage4({required this.password});

  
}


