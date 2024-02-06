import 'package:firebase_test/firebasedb.dart';
import 'package:firebase_test/homepage.dart';
import 'package:firebase_test/loginpage.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _LoginPageState();
}

class _LoginPageState extends State<Signup> {
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "email",
              ),
              controller: email_controller,
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
              ),
              controller: password_controller,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text('forgot password'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                String email = email_controller.text.trim();
                String pwd = password_controller.text.trim();

                FirebaseHelper()
                    .signUp(email: email, password: pwd)
                    .then((result) {
                  if (result == null) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(result)));
                  }
                });
              },
              child: const Text(
                'Sign up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Already account ?'),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      )),
                  child: const Text(
                    'Login now',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
