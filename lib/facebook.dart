import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


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
    return Container(
      width: 300,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue
      ),
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SignInButton(
            Buttons.Facebook,
            text: "Log in with facebook",
            mini: true,
            onPressed: () {
              signInWithFacebook();
            },
          ),
          const Text("  Log in with facebook",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
        ],
      ),
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