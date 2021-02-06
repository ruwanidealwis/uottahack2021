import 'package:flutter/material.dart';
import 'package:uottahack/firebase/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseSignIn _auth = FirebaseSignIn();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: SignInForm());
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                    dynamic user = await firebaseSignIn.signIn(
                        emailController.text, passwordController.text);
                    if (user.runtimeType == "String") {
                      print(user);
                    }

                    // Process data.
                  } else {}
                },
                child: Text("Login"))
          ],
        ));
  }
}
