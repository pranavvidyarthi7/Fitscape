import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  Future<void> formAuth({String email, String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> googleAuth() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleSignInAccount;
    GoogleSignInAuthentication googleSignInAuthentication;
    UserCredential authResult;
    googleSignInAccount =
        await googleSignIn.signIn(); //NEVER GIVES EXCEPTION SO IF ELSE CHECK
    if (googleSignInAccount != null) {
      try {
        googleSignInAuthentication = await googleSignInAccount.authentication;
      } on Exception catch (e) {
        print(
            'GOOGLE ERROR CAUGHT CUSTOM ERROR SENT ERROR GIVEN::${e.toString()}');
        throw PlatformException(
            code: 'Authentication Failed',
            message: 'Google authentication failed. Try again later.',
            details: 'single');
      }
      try {
        authResult = await FirebaseAuth.instance.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential')
          throw PlatformException(
              code: 'Email already in use',
              message: 'There is already a user with this email',
              details:
                  'single'); //ONLY IF ALREADY GOOGLE, PRIORITY ORDER GOOGLE>FB>Email&Pas
        else if (e.code == 'user-disabled')
          throw PlatformException(
              code: 'Email Disabled',
              message: 'This email has been disabled by the App managers.',
              details: 'single');
        else {
          print('Something went WRONG HERE');
          throw PlatformException(
              code: 'Authentication Failed',
              message: 'Google authentication failed. Try again later.',
              details: 'single');
        }
      } catch (error) {
        print(error.toString());
        throw PlatformException(
            code: 'Something went wrong',
            message:
                'Something went wrong while authenticating with google. Try again later.',
            details: 'single');
      } finally {
        await googleSignIn.signOut();
      }
    } else
      throw PlatformException(
          code: 'Error_Aborted_by_User',
          message: 'Sign in aborted by user',
          details: 'single');
    return authResult;
  }
}
