import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uottahack/firebase/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return new Scaffold(body: RegisterForm());
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Passowrd', hintText: "Passwords must be X "),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a vaild password';
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    print(emailController.text);
                    FirebaseSignIn firebaseSignIn = FirebaseSignIn();
                    dynamic user = await firebaseSignIn.regiser(
                        nameController.text,
                        emailController.text,
                        passwordController.text);
                    if (user.runtimeType == "String") {
                      print(user);
                    }

                    // Process data.
                  } else {}
                },
                child: Text("Sign  Up"))
          ],
        ));
  }
}
