import 'package:firebase_core/firebase_core.dart';

class Auth {
  final FirebaseAuth auth;

  Auth(this.auth);

  Stream<User> get user => auth.authStateChanges();

  Future<String> createAccount({String email, String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return "Success";
    } on FirebaseAuthException catch (e){
      return e.message;
    } catch (e){
      rethrow;
    }
  }
}