import 'package:firebase_auth/firebase_auth.dart';
import 'package:minerestoran/database/auth/model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> singIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user!;
      return UserModel.fromFirebase(user);
    } catch (e) {}
  }
    Future<UserModel?> createIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user!;
      return UserModel.fromFirebase(user);
    } catch (e) {}
  }

  Future<void> logOut() async{
    return await _firebaseAuth.signOut();
  }
  Stream<UserModel?> get currentUser {
    return _firebaseAuth.authStateChanges()
        .map((user) => user != null ? UserModel.fromFirebase(user) : null);
  }
}
