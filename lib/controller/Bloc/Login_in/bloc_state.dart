import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState{}
//
class AuthLogInState extends AuthState {
  final User admin;
  AuthLogInState(this.admin);
}

class AuthLogOutState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
