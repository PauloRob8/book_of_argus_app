import 'package:bloc/bloc.dart';
import 'package:book_of_argus/cubits/login/login_state.dart';
import 'package:book_of_argus/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.preferences,
    AuthService? authService,
  })  : _authService = authService ?? AuthService(),
        super(LoginState.initial());

  final SharedPreferences preferences;
  final AuthService _authService;
  late String userId;

  void valiadeUserCredentials({
    required String email,
    required String password,
  }) {
    if (email.isEmpty) {
      emit(
        LoginState.error(errorType: LoginError.emptyEmail),
      );
    } else if (password.isEmpty) {
      emit(
        LoginState.error(errorType: LoginError.emptyPassword),
      );
    } else {
      _onLogin(
        email: email,
        password: password,
      );
    }
  }

  Future<void> logout() async {
    await preferences.remove('userId');
    FirebaseAuth.instance.signOut();
    emit(LoginState.logout());
  }

  Future<void> _onLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginState.loading());
    try {
      final user = await _authService.loginUser(email, password);

      userId = user.user!.uid;

      debugPrint(userId);

      final dataOnFirestore = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (!dataOnFirestore.exists) {
        FirebaseFirestore.instance.collection('users').doc(userId).set({
          'email': user.user!.email,
          'isMaster': false,
        });
      }

      emit(LoginState.success(userId: userId));
    } on FirebaseAuthException catch (error) {
      _onError(error);
    }
  }

  void _onError(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        emit(LoginState.error(errorType: LoginError.invalidEmail));
        break;
      case 'wrong-password':
        emit(LoginState.error(errorType: LoginError.invalidPassword));
        break;
      case 'user-not-found':
        emit(LoginState.error(errorType: LoginError.userNotFound));
        break;
      default:
    }
  }
}
