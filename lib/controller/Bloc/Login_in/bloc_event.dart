import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixels_admin/controller/Bloc/Login_in/bloc_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitialState()) {
    User? currentUser = _auth.currentUser;

    //
    if (currentUser != null) {
      //Login ...............
      emit(AuthLogInState(currentUser));
    } else {
      emit(AuthLogOutState());
    }
  }
  void logOut() async {
    await _auth.signOut();
    emit(AuthLogOutState());
  }
}
