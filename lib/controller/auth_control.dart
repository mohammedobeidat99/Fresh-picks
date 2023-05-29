import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../consts/consts.dart';
import '../consts/firebase_const.dart';
import '../view/auth_screen/login_screen.dart';

class AuthCotroller extends GetxController {
  var isloading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // Login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: "name or password in not correct");
     
    }
    return userCredential;
  }

  //Signup method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
          
    } on FirebaseException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  storeUserData({name, password, email, number,addres}) async {
    DocumentReference store =
        firestore.collection(usersCollection).doc(currntUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currntUser!.uid,
      'number': number,
      'addres':addres,
      
      
    });
  }

  //signout Method
  signoutMethod(context) async {
    try {
      await auth.signOut();
      Get.offAll(() => const LoginScreen());
      isloading=false.obs;

    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
