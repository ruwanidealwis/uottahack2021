import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uottahack/firebase/auth.dart';
import 'package:uottahack/screens/home/home.dart';

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
    return Container(
      color: Color.fromRGBO(205, 227, 244, 1),
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
              Image.asset('assets/images/timbit.png',
              ),
              Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'Passowrd', hintText: "Passwords must be X "),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            Container(
                height: MediaQuery.of(context).size.height * 0.12,
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
                      dynamic user = await firebaseSignIn.regiser(
                          nameController.text,
                          emailController.text,
                          passwordController.text);
                      if (user.runtimeType == "String") {
                        print(user);
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()));
                      }

                      // Process data.
                    } else {}
                  },
                  child: Text("Sign  Up"))
            ),
          ],
        ),
      ),
    );
  }
}

/*

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
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }

                    // Process data.
                  } else {}
                },
                child: Text("Sign  Up"))
          ],
        ),
    );
 */