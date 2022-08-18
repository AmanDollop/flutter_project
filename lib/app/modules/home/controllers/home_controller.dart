import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController extends GetxController {
  final Email = TextEditingController();
  final Password = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController smsController = TextEditingController();
  late String verification;
  final isLoading = true.obs;

  //final SmsAutoFill _autoFill = SmsAutoFill();

  final count = 0.obs;

  Map<String, dynamic>? _userData;

  var welcome;

  @override
  void onInit() {
    super.onInit();
    welcome = _userData?['email'];
    onPresseds();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> createtoken() async {
    print("checkToken:::");
    String? token = await FirebaseMessaging.instance.getToken();
    print("checkToken::: ${token}");
  }

  void signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        print("User:: ${user?.email}");
        print("User:: ${user?.photoURL}");
        print("User:: ${user?.displayName}");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }
  }

  void signUp() {
    AuthenticationHelper()
        .signUp(email: "aman@gmail.com", password: "123456")
        .then((result) {
      if (result == null) {
        print("signUp::: Success");
      } else {
        print("signUp::: Error");
      }
    });
  }

  void signIn() {
    AuthenticationHelper()
        .signIn(email: "jaiswal@gmail.com", password: "123456")
        .then((result) {
      if (result == null) {
        print("signIn::: Success");
      } else {
        print("signIn::: Error ${result}");
      }
    });
  }

  Future<UserCredential> clickFbButton() async {
    final LoginResult result =
        await FacebookAuth.instance.login(permissions: []);

    print(":::::::::::::::::::: ${result.status}");

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();

      print(userData.toString());
      _userData = userData;
    } else {
      print(result.message);
    }

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verification.toString(),
        smsCode: smsController.text,
      );
      final User? user = (await auth.signInWithCredential(credential)).user;
      print("Successfully signed in UID: ${user?.uid}");
    } catch (e) {
      print("Failed to sign in: " + e.toString());
    }
  }

  Future<void> verifyPhoneNumber() async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumberController.text,
          timeout: const Duration(seconds: 5),
          verificationCompleted: (PhoneAuthCredential credential) {
            print(
                "Phone number automatically verified and user signed in: ${auth
                    .currentUser?.uid}");
          },
          verificationFailed: (FirebaseAuthException authException) {
            print(
                'Phone number verification failed. Code: ${authException
                    .code}. Message: ${authException.message}');
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            print('Please check your phone for the verification code.');
            verification = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print("verification code: " + verificationId);
            verification = verificationId;
          });
    } catch (e) {
      print("Failed to Verify Phone Number: ${e}");
    }
  }


  onPresseds(){
    isLoading.value= true;
    Future.delayed(const Duration(seconds: 3), () {
    isLoading.value = false;
    });
  }
}

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();

    print('signOut');
  }
}
