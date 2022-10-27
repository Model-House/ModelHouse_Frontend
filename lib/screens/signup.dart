import 'package:flutter/material.dart';
import 'package:model_house/screens/signin.dart';

import '../models/user.dart';
import '../services/security_service.dart';
import 'interest.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool isCheckbox = false;
  bool isCheckboxV2 = false;
  HttpSecurity? _httpSecurity;
  User? user;
  String? message;
  String request = "";

  void initState() {
    _httpSecurity = HttpSecurity();
    super.initState();
  }

  Future initialize() async {
    message =
        await _httpSecurity?.signUp(username.text, email.text, password.text);
    setState(() {
      user = user;
      if (message == '{"message":"Registration successful"}') {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Registration successful"),
                content: const Text("Sign Up"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const SignIn();
                            },
                          ),
                        );
                      },
                      child: const Text("Ok"))
                ],
              );
            });
      } else {
        if (message == '{"message":"Email is already taken"}') {
          request = "This Email is already used";
        } else {
          request = "Something bad happened. Try again.";
        }
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(request),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        email.text = "";
                        password.text = "";
                        confirmPassword.text = "";
                      },
                      child: const Text("Try again"))
                ],
              );
            });
      }
    });
  }

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
            height: 50,
          ),
          textUsername(),
          inputUsername(),
          const SizedBox(
            height: 20,
          ),
          textEmail(),
          inputEmail(),
          const SizedBox(
            height: 20,
          ),
          textPassword(),
          inputPassword(),
          const SizedBox(
            height: 20,
          ),
          textConfirmPassword(),
          inputConfirmPassword(),
          checkEnterprise(),
          checkConditions(),
          buttonSignUp()
        ],
      ),
    );
  }

  Widget title() {
    return const Text(
      "Complete the Sign Up",
      style: TextStyle(
          color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.bold),
    );
  }

  Container inputUsername() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: username,
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
            hintText: "Set a username for your profile",
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
          ),
        ));
  }

  Container inputEmail() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: email,
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
              hintText: "Type your email",
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

  Container inputConfirmPassword() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: confirmPassword,
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
              hintText: "Type your password again",
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none),
        ));
  }

  Container buttonSignUp() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width - 10,
      child: ElevatedButton(
        onPressed: () {
          initialize();
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Row checkEnterprise() {
    return Row(children: [
      Checkbox(
          value: isCheckbox,
          onChanged: (bool? newBool) {
            setState(() {
              isCheckbox = newBool!;
            });
          }),
      const Text('Enterprise account?',
          style: TextStyle(color: Colors.white, fontSize: 14)),
    ]);
  }

  Row checkConditions() {
    return Row(children: [
      Checkbox(
          value: isCheckboxV2,
          onChanged: (bool? newBool) {
            setState(() {
              isCheckboxV2 = newBool!;
            });
          }),
      const Text('I have read and agree to the ',
          style: TextStyle(color: Colors.white, fontSize: 13)),
      const Text(
        'Terms of service ',
        style: TextStyle(color: Colors.red, fontSize: 13),
      ),
      const Text('& ', style: TextStyle(color: Colors.white, fontSize: 13)),
      const Text(
        'Privacy policy',
        style: TextStyle(color: Colors.red, fontSize: 13),
      ),
    ]);
  }

  Container textUsername() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: const [
            Text(
              'Your username',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ));
  }

  Container textEmail() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: const [
            Text(
              'Your email',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ));
  }

  Container textPassword() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: const [
            Text(
              'Your password',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ));
  }

  Container textConfirmPassword() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: const [
            Text(
              'Confirm password',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ));
  }
}
