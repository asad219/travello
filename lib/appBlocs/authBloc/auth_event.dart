import 'package:equatable/equatable.dart';

abstract class AuthEvent  {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class SignupEvent extends AuthEvent {
  final String username;
  final String password;
  final String email;
  final String phone;

  SignupEvent(this.username, this.password, this.email, this.phone);

  @override
  List<Object?> get props => [username, password, email, phone];
}

class ShowHideEvent extends AuthEvent {
  final bool showHide ;
  ShowHideEvent(this.showHide);


  @override
  List<Object?> get props => [showHide];
}
