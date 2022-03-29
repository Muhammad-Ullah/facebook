import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: const Center(
        child: Text("Successfully Logged in from Facebook",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
      ),
    );
  }
}
