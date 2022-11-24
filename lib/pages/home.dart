// import 'dart:html';

// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 61, 61, 61),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Signed In: $user",
                  style: TextStyle(color: Colors.white),
                ),
                CupertinoButton(
                  child: Text("Sign Out!"),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                )
              ],
            ),
          ),
        ))));
  }
}
