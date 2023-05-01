import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project_health_notes/services/auth.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class Login extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const Login({
    Key? key,
    required this.auth,
    required this.firestore,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6EDEE),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Builder(builder: (BuildContext context){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: "Username"),
                  controller: _emailController,
                  ),
                TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: "Password"),
                controller: _passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey.shade600),
                    onPressed: () async {
                      final String? retVal = await Auth(auth: widget.auth).signIn(
                          email: _emailController.text,
                          password: _passwordController.text,
                      );
                      if (retVal =="Success"){
                        _emailController.clear();
                        _passwordController.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(retVal!),
                          ),
                        );
                      }
                    },
                    child: const Text("Sign in"),
                ),
                TextButton(
                  onPressed: () async {
                    final String? retVal = await Auth(auth: widget.auth).signIn(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    if (retVal =="Success"){
                      _emailController.clear();
                      _passwordController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(retVal!),
                        ),
                      );
                    }
                  },
                  child: const Text("Create account"),
                )
              ],
            );
          },),
        ),
      ),
    );
  }
}
