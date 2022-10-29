import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:realestate/Core/SharedModel/FireMessage.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/Authentication/domain/entities/UserEntity.dart';

import '../../../../Core/Utils.dart';
import '../../data/remote/data_sources/AuthFirebaseDataSource.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  UserEntity ?userEntity;

  AuthBloc() : super(AuthState(message: FireMessage("Initial"))) {
    on<SignInEvent>((event, emit) async{
      await handleInternetConnectionStates(
          onSuccessConnection: ()async => await signIn(emit,event),
          onFailureConnection: ()=> emit(state.copyWith(errorMessage: "No Internet"))
      );
    });

    on<SignOutEvent>((event, emit) async{
      await handleInternetConnectionStates(
          onSuccessConnection: ()async => await signOut(emit),
          onFailureConnection: ()=> emit(state.copyWith(errorMessage: "No Internet"))
      );
    });

    on<SignUpEvent>((event, emit) async{
      await handleInternetConnectionStates(
          onSuccessConnection: ()async => await signUp(event, emit),
          onFailureConnection: ()=> emit(state.copyWith(errorMessage: "No Internet"))
      );
    });

    on<CheckIfUserLoggedIn>((event, emit) async{
      await handleInternetConnectionStates(
          onSuccessConnection: ()async => await checkIfUserLoggedIn(emit),
          onFailureConnection: ()=> emit(state.copyWith(errorMessage: "No Internet"))
      );
    });

  }

  Future<void> signIn(Emitter<AuthState> emit, SignInEvent event) async {
    emit(AuthState().copyWith(message: FireMessage("Loading")));
    final result = await  dl<AuthFirebaseDataSource>().login(email: event.email!, password: event.password!);
    result.fold((left) {
      emit(state.copyWith(message : left,errorMessage: left.message));
    }, (right){
      updateUserEntity(right);
      fillTextFieldsController(right);
      emit(state.copyWith(userEntity: right,message: FireMessage("Logged In"),errorMessage: ""));
    });
  }

  Future<void> signOut(Emitter<AuthState> emit) async {
    emit(AuthState().copyWith(message: FireMessage("Loading")));
    await dl<AuthFirebaseDataSource>().signOut().fold((left){
      emit(AuthState().copyWith(message: left,errorMessage: left.message,userEntity: null));
    }, (right){
      updateUserEntity(null);
      emit(AuthState().copyWith(message: FireMessage("User Signed Out"),userEntity: null));
    });
  }

  Future<void> checkIfUserLoggedIn(Emitter<AuthState> emit) async {
    emit(AuthState().copyWith(message: FireMessage("Loading")));
    final result = await dl<AuthFirebaseDataSource>().checkIfUserLoggedIn();
    result.fold((left) {
      emit(AuthState().copyWith(message: left,errorMessage: left.message));
    },(right) {
      if(right==null){
        emit(AuthState().copyWith(message: FireMessage("Not Logged"),userEntity: right));
      }
      else{
        fillTextFieldsController(right);
        updateUserEntity(right);
        emit(AuthState().copyWith(message: FireMessage("Already Logged"),userEntity: right));
      }
    });
  }

  Future<void> signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthState().copyWith(message: FireMessage("Loading")));
    await dl<AuthFirebaseDataSource>().signUp(userEntity: event.userEntity!).fold((left){
      emit(AuthState().copyWith(message: left,errorMessage: left.message));
    }, (right){
      fillTextFieldsController(right);
      updateUserEntity(right);
      emit(AuthState().copyWith(message: FireMessage("Logged in"),userEntity: right,errorMessage: ""));
    });
  }

  void updateUserEntity(UserEntity ?right) {
    userEntity=right;
  }

  void fillTextFieldsController(UserEntity right) {
    emailController.text=right.email!;
    phoneNumberController.text=right.phoneNumber!;
    passwordController.text=right.password!;
    confirmPasswordController.text=right.password!;
  }
}
