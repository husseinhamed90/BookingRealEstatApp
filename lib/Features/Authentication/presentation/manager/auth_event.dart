part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInEvent extends AuthEvent{
  @override
  String ?email,password;
  // TODO: implement props
  List<Object?> get props =>[email,password];

  SignInEvent({this.email, this.password});
}
class SignOutEvent extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class SignUpEvent extends AuthEvent{
  @override
  UserEntity ?userEntity;
  // TODO: implement props
  List<Object?> get props =>[userEntity];

  SignUpEvent({this.userEntity});
}
class CheckIfUserLoggedIn extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class GetUserData extends AuthEvent{
  String ?userId;
  @override
  GetUserData({this.userId});
  // TODO: implement props
  List<Object?> get props =>[userId];
}