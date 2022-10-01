part of 'auth_bloc.dart';

class AuthState extends Equatable {
  FireMessage ?message;
  String errorMessage="";
  UserEntity ?userEntity;
  AuthState copyWith({
    FireMessage ?message,
    UserEntity ?userEntity,
    String ?errorMessage
  }) {
    return AuthState(
      message: message ?? this.message,
      userEntity: userEntity ?? this.userEntity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [message,userEntity];

  AuthState({this.message,this.userEntity,this.errorMessage=""});
}
