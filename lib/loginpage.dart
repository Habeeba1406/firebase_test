import 'package:firebase_test/firebasedb.dart';
import 'package:firebase_test/homepage.dart';
import 'package:firebase_test/signuppage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Log in',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "email",
                  hintStyle: TextStyle(
                    fontSize: 20,
                  )),
              controller: username_controller,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "password",
                  hintStyle: TextStyle(
                    fontSize: 20,
                  )),
              controller: password_controller,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text('forgot password?'),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                String email = username_controller.text.trim();
                String pass = password_controller.text.trim();
                FirebaseHelper()
                    .loginIn(email: email, password: pass)
                    .then((result) {
                  if (result == null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(result)));
                  }
                });
              },
              child: const Text(
                'Login now',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Don't have no account ?"),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      )),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.blue,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
