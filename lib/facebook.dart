// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
//
//
// class FacebookLogin extends StatefulWidget {
//   const FacebookLogin({Key? key}) : super(key: key);
//
//   @override
//   _FacebookLoginState createState() => _FacebookLoginState();
// }
//
// class _FacebookLoginState extends State<FacebookLogin> {
//
//   Map<String, dynamic>? _userData;
//
//   String welcome = "Facebook";
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextButton(onPressed: (){
//             signInWithFacebook();
//           }, child: Text(welcome))
//
//         ],
//       ),
//     );
//   }
//
//
//   Future<UserCredential> signInWithFacebook() async {
//
//     final LoginResult result = await FacebookAuth.instance.login(permissions:['email']);
//
//
//     if (result.status == LoginStatus.success) {
//
//       final userData = await FacebookAuth.instance.getUserData();
//       _userData = userData;
//     } else {
//       print(result.message);
//     }
//
//     setState(() {
//       welcome = _userData?['email'];
//     });
//
//
//     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);
//
//     return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
//   }
//
// }