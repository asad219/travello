abstract class AuthEvent{}

class LoginEvent extends AuthEvent{
  final String username;
  final String password;

  LoginEvent(this.username,this.password);
}

class SignupEvent extends AuthEvent{
  final String username;
  final String password;
  final String email;
  final String phone;

  SignupEvent(this.username,this.password,this.email,this.phone);
}