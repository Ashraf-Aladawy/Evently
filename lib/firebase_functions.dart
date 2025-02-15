import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class FirebaseFunctions {
  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return TaskModel.toJson(value);
      },
    );
  }

  static Future<void> addEvent(TaskModel task) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getEvents(String category) {
    var collection = getTaskCollection();
    if (category == "All") {
      return collection
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy("date")
          .snapshots();
    } else {
      return collection
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("imageName", isEqualTo: category)
          .orderBy("date")
          .snapshots();
    }
  }

  static Future<void> deleteEvent(String id) {
    var collection = getTaskCollection();
    return collection.doc(id).delete();
  }

  static Future<void> createAccount({
    required String emailAddress,
    required String password,
    required String name,
    required Function onLoading,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      onLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user!.sendEmailVerification();
      UserModel user =
          UserModel(id: credential.user!.uid, name: name, email: emailAddress);
      addUser(user);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
        print('The account already exists for that email.');
      }
    } catch (e) {
      onError("Some thing is Wrong");
    }
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return UserModel.toJson(value);
      },
    );
  }

  static Future<void> addUser(UserModel user) {
    var collection = getUsersCollection();
    var decRef = collection.doc(user.id);
    return decRef.set(user);
  }

  static Future<void> logIn({
    required String emailAddress,
    required String password,
    required Function onLoading,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      onLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError("Invalid email or password");
    }
  }


}
