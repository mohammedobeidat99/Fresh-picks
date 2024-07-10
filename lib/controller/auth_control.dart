import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_picks/view/home_screen2/home.dart';
import 'package:get/get.dart';
import '../consts/consts.dart';
import '../consts/firebase_const.dart';
import '../view/auth_screen/login_screen.dart';

class AuthController extends GetxController {
  var isloading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
//login method
Future<void> loginMethod({BuildContext? context}) async {
  try {
    // Validate inputs
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      throw 'Email and password empty';
    }

    // Start loading
    isloading(true);

    // Perform login
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    // Stop loading
    isloading(false);

    // Navigate on success
    Get.offAll(() => const Home());
    VxToast.show(context!, msg: "Login Success".tr);
  } catch (e) {
    // Stop loading
    isloading(false);

    // Handle errors
    if (e is FirebaseAuthException) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        // Specific error message for incorrect email or password
        VxToast.show(context!, msg: "Incorrect email or password".tr);
      } else {
        // Generic error message for other FirebaseAuthException errors
        VxToast.show(context!, msg: "Error: ${e.message}");
      }
    } else {
      // Show generic error message for other exceptions
      VxToast.show(context!, msg: "Error: $e");
    }
  }
}


//sginup Method
  Future<UserCredential?> signupMethod({email, password, name, imageUrl, number, address, context}) async {
  try {
    // Start loading
    isloading(true);

    // Create user with email and password
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Stop loading
    isloading(false);

    // Show success notification
    VxToast.show(context, msg: "Registration Success".tr);

    // Store user data in Firestore
    await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
      'name': name,
      'email': email,
      'imageUrl': '',
      'id': userCredential.user!.uid,
      'number': number,
      'address': address,
    });

    return userCredential;
  } catch (e) {
    // Stop loading
    isloading(false);

    // Show error notification
    VxToast.show(context, msg: e.toString());
    return null; // Return null as registration failed
  }
}
  // storeUserData({name, password, email, number, addres}) async {
  //   DocumentReference store =
  //       firestore.collection(usersCollection).doc(currntUser!.uid);
  //   store.set({
  //     'name': name,
  //     'password': password,
  //     'email': email,
  //     'imageUrl': '',
  //     'id': currntUser!.uid,
  //     'number': number,
  //     'addres': addres,
  //   });
  // }


  //signout Method
  signoutMethod(context) async {
    try {
      await auth.signOut();
      Get.offAll(() => const LoginScreen());
      isloading = false.obs;
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
