import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';

import '../../../helper/Utils.dart';
import '../../../helper/api_client.dart';
import '../../model/User.dart';
import '../../model/res.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    // login logic
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        // Simulate a login process
        String url = ApiClient.login;
        // You should replace this with actual authentication logic

        var response = await post(Uri.parse(url), body: {
          "name": event.username,
          "password": event.password,
        });

        print("login: " + response.body.toString());

        if (response.body.contains("status") &&
            response.body.contains("failed")) {
          Res res = Res.fromJson(jsonDecode(
              response.body.replaceAll("successfully connected", "")));
          emit(AuthFailure(res.message.toString()));
        } else {
          Utils.userInfo = User.fromJson(jsonDecode(
              response.body.replaceAll("successfully connected", ""))[0]);
          if (Utils.userInfo is Null) {
            emit(AuthFailure("Invalid username and password."));
          } else {
            emit(AuthSuccess("Login successful!"));
          }
        }
      } catch (e) {
        print(e);
        emit(AuthFailure("An error occurred."));
      }
    });

    // signup logic
    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        // Simulate a login process
        String url = ApiClient.signup;
        // You should replace this with actual authentication logic

        var response = await post(Uri.parse(url), body: {
          "name": event.username,
          "password": event.password,
          "email": event.email,
          "phone": event.phone
        });

        print("signup: " + response.body.toString());

        if (response.body.contains("status")) {
          Res res = Res.fromJson(jsonDecode(response.body));

          if (res.status == "failed") {
            emit(AuthFailure(res.message.toString()));
          } else {
            emit(AuthSuccess(res.message.toString()));
          }
        }
      } catch (e) {
        emit(AuthFailure("An error occurred."));
      }
    });

    // show hide password
    // on<ShowHidePasswordEvent>((event, emit) {
    //   bool e = event.showHide;
    //   print(e);
    //   emit(ShowHidePasswordState(event.showHide));
    // });
  }
}
