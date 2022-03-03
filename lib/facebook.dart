import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class FacebookLogin extends StatefulWidget {
  const FacebookLogin({Key? key}) : super(key: key);

  @override
  _FacebookLoginState createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLogin> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text(
            "Facebook Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child:   _displayLoginButton(),
        ),
    );
  }


  _displayLoginButton() {
    return TextButton(
      child: const Text(
        "Login with Facebook",
        style: TextStyle(color: Colors.blue),
      ),
      onPressed: () {
        signInWithFacebook();
      },
    );
  }
  void signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      print("Success");
      final AuthCredential facebookCredential = FacebookAuthProvider.credential(result.accessToken!.token);
      final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookCredential);

    } catch (e) {
      print("error occured");
      print(e.toString());
    }
  }

}