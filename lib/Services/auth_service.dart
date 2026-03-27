import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 🔐 GET USER ACTUAL
  User? get currentUser => _auth.currentUser;

  // 🟢 REGISTRO
  Future<User?> register(String email, String password) async {
  try {
    UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    return userCredential.user;

  } on FirebaseAuthException catch (e) {
    print("🔥 Firebase error code: ${e.code}");
    print("🔥 Firebase error message: ${e.message}");
    return null;

  } catch (e) {
    print("🔥 Error inesperado: $e");
    return null;
  }
}
  // 🔵 LOGIN
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("Error login: ${e.message}");
      return null;
    } catch (e) {
      print("Error inesperado: $e");
      return null;
    }
  }

  // 🔴 LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }
}

//hola buenas//