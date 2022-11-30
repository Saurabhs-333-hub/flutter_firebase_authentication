// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughts/auth/pages/forgot_password.dart';
// import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  final VoidCallback register;
  const Login({super.key, required this.register});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  Future signIn() async {
    showBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(67, 165, 105, 255),
                borderRadius: BorderRadius.circular(60),
                backgroundBlendMode: BlendMode.color,
              ),
              height: 100,
              width: 100,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  color: Color.fromARGB(255, 225, 0, 255),
                ),
              ),
            ),
          );
        });
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(), password: _password.text.trim());
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 26, 26, 46),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 40.0,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Text("Hello Again!",
                    //     style: GoogleFonts.bebasNeue(
                    //         fontSize: 36,
                    //         color: Color.fromARGB(255, 255, 255, 255))),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(198, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 43, 41, 86)),

                      child: TextField(
                        controller: _email,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 16)),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(198, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 43, 41, 86)),
                      child: TextField(
                        controller: _password,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 16)),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) {
                            return ForgotPassword();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Forgot Password?",
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 0, 140, 255))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: signIn,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(161, 37, 37, 104),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text("Sign In",
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color:
                                        Color.fromARGB(255, 255, 255, 255)))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an Account? ",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255))),
                        GestureDetector(
                          onTap: widget.register,
                          child: Text("Register Now!",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 0, 140, 255))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
