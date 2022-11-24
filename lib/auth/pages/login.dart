// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(), password: _password.text.trim());
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
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.coffee_outlined,
                        color: Color.fromARGB(255, 255, 255, 255)),
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
                          color: Color.fromARGB(255, 61, 61, 61)),

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
                          color: Color.fromARGB(255, 61, 61, 61)),
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
                    GestureDetector(
                      onTap: signIn,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 229, 229, 229),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(child: Text("Sign In")),
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
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255))),
                        GestureDetector(
                          onTap: widget.register,
                          child: Text("Register Now!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
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
