
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginPage(),
      //FacebookLogin(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoggedIn = false;
  bool isLoading = false;
  var profileData;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F67),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF02BB9F)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Facebook Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child:   _displayLoginButton(),
        ),
      ),
    );
  }


  _displayLoginButton() {
    return TextButton(
      child: const Text(
        "Login with Facebook",
        style: TextStyle(color: Colors.white),
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