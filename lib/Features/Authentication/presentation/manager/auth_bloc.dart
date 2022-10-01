import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:realestate/Core/SharedModel/FireMessage.dart';
import 'package:realestate/DependencyInjection.dart';
import 'package:realestate/Features/Authentication/domain/entities/UserEntity.dart';

import '../../data/remote/data_sources/AuthFirebaseDataSource.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(message: FireMessage("Initial"))) {
    on<SignInEvent>((event, emit) async{
      emit(AuthState().copyWith(message: FireMessage("Loading")));
      final result = await  dl<AuthFirebaseDataSource>().login(email: event.email!, password: event.password!);
      result.fold((left) {
        emit(state.copyWith(message : left,errorMessage: "Error"));
      }, (right){
        emit(state.copyWith(userEntity: right,message: FireMessage("Logged In"),errorMessage: ""));
      });
    });

    on<SignOutEvent>((event, emit) async{
      emit(AuthState().copyWith(message: FireMessage("Loading")));
      await dl<AuthFirebaseDataSource>().signOut().then((value) {
        emit(AuthState().copyWith(message: FireMessage("User Signed Out")));
      });
      await dl<AuthFirebaseDataSource>().signOut().fold((left){
        emit(AuthState().copyWith(message: left,errorMessage: "Error"));
      }, (right){
       // emit(AuthState().copyWith(message: FireMessage("Logged in"),userEntity: right,errorMessage: ""));
      });
    });

    on<SignUpEvent>((event, emit) async{
      emit(AuthState().copyWith(message: FireMessage("Loading")));
      await dl<AuthFirebaseDataSource>().signUp(userEntity: event.userEntity!).fold((left){
        emit(AuthState().copyWith(message: left,errorMessage: "Error"));
      }, (right){
        emit(AuthState().copyWith(message: FireMessage("Logged in"),userEntity: right,errorMessage: ""));
      });
    });


    on<GetUserData>((event, emit) async{
      QuerySnapshot <Map>?querySnapshot = await FirebaseFirestore.instance.collection("Users").where("id",isEqualTo: event.userId).get();
      emit(AuthState().copyWith(userEntity: UserEntity.fromJson(querySnapshot.docs[0].data().cast()),message: FireMessage("Already Logged")));
    });


    on<CheckIfUserLoggedIn>((event, emit){

      dl<AuthFirebaseDataSource>().checkIfUserLoggedIn.listen((event){
        if(event==null){
          emit(AuthState().copyWith(message: FireMessage("Not Logged")));
        }
        else{
          add(GetUserData(userId: event.uid));
        }
      });

    });
  }
}
