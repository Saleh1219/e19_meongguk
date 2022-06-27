import 'package:e19_meongguk/admin/mainAdmin.dart';
import 'package:e19_meongguk/signUp.dart';
import 'package:e19_meongguk/splashscreen.dart';
import 'package:e19_meongguk/user/landingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 126, bottom: 50),
                child: Text(
                  "Sign In!",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    hintText: "Masukkan Email Anda",
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  obscureText: true,
                  controller: passwordCtrl,
                  decoration: InputDecoration(
                    hintText: "Masukkan Password Anda",
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lime,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (emailCtrl.text == "admin@gmail.com" &&
                      passwordCtrl.text == "admin123") {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailCtrl.text, password: passwordCtrl.text)
                        .then((value) => Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (context) => AdminMainPage()))));
                    emailCtrl.text = "";
                    passwordCtrl.text = "";
                  } else {
                    try {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailCtrl.text,
                              password: passwordCtrl.text)
                          .then(
                            (value) => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return LandingPage();
                              }),
                            ),
                          );
                      emailCtrl.text = "";
                      passwordCtrl.text = "";
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-email') {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                  "Email yang anda masukkan tidak valid",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                actions: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "OK",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      } else if (e.code == 'wrong-password') {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                  "Email atau Password Salah",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                actions: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "OK",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      } else if (e.code == 'user-not-found') {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                  "Email tidak ditemukan",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                actions: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "OK",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                  "mohon masukkan Email dan Password",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                actions: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "OK",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      }
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff354259),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Container(
                  height: 40,
                  width: 60,
                  child: const Center(
                    child: Text(
                      "Sign In",
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 40),
                child: Row(
                  children: [
                    Text(
                      "belum memiliki akun?",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return SignUpPage();
                            }),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(),
                        ))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
