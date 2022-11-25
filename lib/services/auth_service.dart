import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static User? getCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }

  Future<UserCredential> loginUser(
    String email,
    String password,
  ) async {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return user;
  }

  Future<UserCredential> registerUser(
    String email,
    String password,
  ) async {
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user;
  }
}
