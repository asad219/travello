import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

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

// class ShowHidePasswordEvent extends AuthEvent {
//   bool showHide = false;
//   ShowHidePasswordEvent(bool showHide);

//   @override
//   List<Object?> get props => [showHide];
// }
