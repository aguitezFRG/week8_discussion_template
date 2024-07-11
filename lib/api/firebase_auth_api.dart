import "package:firebase_auth/firebase_auth.dart";

class FirebaseAuthAPI {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> getUserStream() {
    // checks if the user is logged in or not
    return auth.authStateChanges();
  } 

  User? getuser() {
    // checks which user is currently logged in
    return auth.currentUser;
  }

  Future<String> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return "Successfully signed in!";
    } 
    on FirebaseAuthException catch (e) {
      return "Failed with error ${e.code}";
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      return "Successfully signed up!";
    } 
    on FirebaseAuthException catch (e) {
      return "Failed with error ${e.code}";
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}