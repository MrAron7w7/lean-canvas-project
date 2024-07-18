import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServiceFirebase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Traer datos
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      DocumentSnapshot doc = await _db.collection('Users').doc(uid).get();
      return doc.data() as Map<String, dynamic>?;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Guardar cuenta usuario
  Future<User?> registerAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Guardar nombre en firestore
      const String user = 'Users';
      await _db.collection(user).doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
      });

      return userCredential.user;
    } catch (error) {
      // Mensaje del error
      print(error);
      return null;
    }
  }

  // Logear usuario
  Future<User?> loginAccount({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  // Cerar session
  Future<void> logOut() async {
    await _auth.signOut();
  }

  // Obtener estado de usuario
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
