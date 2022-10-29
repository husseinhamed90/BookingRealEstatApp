part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}
class OpenFavouritesBox extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SignInEvent extends AuthEvent{
  @override
  String ?email,password;
  List<Object?> get props =>[email,password];

  SignInEvent({this.email, this.password});
}
class SignOutEvent extends AuthEvent{
  @override
  List<Object?> get props =>[];
}

class SignUpEvent extends AuthEvent{
  @override
  UserEntity ?userEntity;
  List<Object?> get props =>[userEntity];

  SignUpEvent({this.userEntity});
}
class CheckIfUserLoggedIn extends AuthEvent{
  @override
  List<Object?> get props =>[];
}
class GetUserData extends AuthEvent{
  String ?userId;
  @override
  GetUserData({this.userId});
  List<Object?> get props =>[userId];
}