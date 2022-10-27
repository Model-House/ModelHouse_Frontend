import 'package:flutter/material.dart';
import 'package:model_house/screens/interest.dart';
import 'package:model_house/screens/place_api.dart';
import 'package:model_house/screens/signup.dart';
import 'package:model_house/services/security_service.dart';

import '../models/user.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isCheckbox = false;
  final password = TextEditingController();
  final email = TextEditingController();
  HttpSecurity? _httpSecurity;
  User? user;

  void initState() {
    _httpSecurity = HttpSecurity();
    super.initState();
  }

  Future initialize() async {
    user = await _httpSecurity?.signIn(email.text, password.text);
    setState(() {
      user = user;
      if (user?.username != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return PlaceApi(user);
            },
          ),
        );
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Invalid email or password"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        email.text = "";
                        password.text = "";
                      },
                      child: const Text("Try again"))
                ],
              );
            });
      }
    });
  }

  void showAlert(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/fondo1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          title(),
          const SizedBox(
            height: 20,
          ),
          textEmailOrUsername(),
          inputEmailOrUsername(),
          const SizedBox(
            height: 20,
          ),
          textPassword(),
          inputPassword(),
          const SizedBox(
            height: 10,
          ),
          buttonSignInEmail(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'OR',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          buttonSignInGoogle(),
          noAccount(),
        ],
      ),
    );
  }

  Container title() {
    return Container(
        padding: const EdgeInsets.all(20),
        child: const Text(
          "Sign In to continue",
          style: TextStyle(
              color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));
  }

  Container buttonSignInEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width - 10,
      child: ElevatedButton(
        onPressed: () {
          initialize();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
        child: const Text(
          'Sign In',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Container buttonSignInGoogle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width - 10,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          'Sign In with Google',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Container noAccount() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          const Text("Don't have an account? ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SignUp();
                  },
                ),
              );
            },
            child: const Text(
              'Sign up',
              style: TextStyle(
                  color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ]));
  }

  Container inputEmailOrUsername() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: email,
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
              hintText: "Type your email or username",
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none),
        ));
  }

  Container inputPassword() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: password,
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
              hintText: "Type your password",
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none),
        ));
  }

  Container textPassword() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: const [
            Text(
              'Password',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            SizedBox(
              width: 180,
            ),
            Text(
              'Forgot password?',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        ));
  }

  Container textEmailOrUsername() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: const [
            Text(
              'Email or username',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ));
  }
}
