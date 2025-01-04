part of 'user_bloc.dart';


abstract class UserState extends Equatable{
  const UserState({required this.user});

  final User user;

  @override
  List<Object> get props => [];
  
}

final class UserInitial extends UserState {
  


  UserInitial() : super(user: User());
}

final class UserDataState extends UserState {
  final User user;

  const UserDataState({required this.user}):super(user:user);
}

