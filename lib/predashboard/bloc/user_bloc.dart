import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../Model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(
    UserDataState(
      user: User(
       
        ),
        ),
        )
         {
    on<UpdatePage1>(_onUpdatePage1);
    on<UpdatePage2>(_onUpdatePage2);
    on<UpdatePage3>(_onUpdatePage3);
    on<UpdatePage4>(_onUpdatePage4);
  }

  Future<void> _onUpdatePage1(UpdatePage1 event,Emitter<UserState> emit) async {
    if (state is UserDataState) {
      final currentUser = (state as UserDataState).user;
      final updatedUser = currentUser.copyWith(
        name: event.name,
        fathersName: event.fathersName,
        gender: event.gender,
        dateOfBirth: event.dob,
        state: event.state,
      );

      emit(UserDataState(user: updatedUser));
    }


  }
   Future<void> _onUpdatePage2(UpdatePage2 event,Emitter<UserState> emit) async {
    if (state is UserDataState) {
      final currentUser = (state as UserDataState).user;
      final updatedUser = currentUser.copyWith(
       email: event.email,
       phoneNumber: event.phoneNumber,
      );

      emit(UserDataState(user: updatedUser));
    }


  }

   Future<void> _onUpdatePage3(UpdatePage3 event,Emitter<UserState> emit) async {
    if (state is UserDataState) {
      final currentUser = (state as UserDataState).user;
      final updatedUser = currentUser.copyWith(
       collegeName: event.collegeName,
       course: event.course,
       year: event.year,
       branch: event.branch,
      );

      emit(UserDataState(user: updatedUser));
    }
   }
     Future<void> _onUpdatePage4(UpdatePage4 event,Emitter<UserState> emit) async {
    if (state is UserDataState) {
      final currentUser = (state as UserDataState).user;
      final updatedUser = currentUser.copyWith(
        password: event.password
      );

      emit(UserDataState(user: updatedUser));
    }


  }


  }


