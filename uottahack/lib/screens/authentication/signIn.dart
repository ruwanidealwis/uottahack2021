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
    return Container(
      //width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.07,
        horizontal: MediaQuery.of(context).size.width * 0.15,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: "Please enter your password"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a vaild password';
                    }
                    return null;
                  },
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Center(
              child: RaisedButton(
                color: Colors.deepPurpleAccent,
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.15,
                ),
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
                child: Text("Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
    ),
    );
  }
}
