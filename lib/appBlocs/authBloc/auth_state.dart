

abstract class AuthState  {

}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState {
  final String message;
  AuthSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);

  @override
  List<Object?> get props => [];
}

class ShowHideState extends AuthState {
  bool showHide = true;
  ShowHideState(this.showHide);

  @override
  List<Object?> get props => [];
}
