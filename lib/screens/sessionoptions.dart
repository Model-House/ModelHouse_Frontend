import 'package:flutter/material.dart';
import 'package:model_house/screens/signin.dart';
import 'package:model_house/screens/signupchoice.dart';

class SessionOptions extends StatefulWidget {
  const SessionOptions({super.key});

  @override
  State<SessionOptions> createState() => _SessionOptionsState();
}

class _SessionOptionsState extends State<SessionOptions> {
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
          Image.asset("images/LogoModelHouse.png"),
          title(),
          buttons()
        ],
      ),
  );
}

  Container title() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Text("Sign In to continue", style: TextStyle(color: Colors.white, fontSize: 48.0, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ));
  }

 Container buttons() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 80),
      width: MediaQuery.of(context).size.width - 10,
      child: Row (
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
              MaterialPageRoute(
              builder: (BuildContext context) {
                return const SignUpChoice();
              },
              ),
              );
            }, 
            child: const Text('Sign Up',
            style: TextStyle(fontSize: 20),),
          ),
          const SizedBox(
          width: 55,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
              MaterialPageRoute(
              builder: (BuildContext context) {
                return const SignIn();
              },
              ),
              );
            }, 
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
            child: const Text('Sign In',
            style: TextStyle(fontSize: 20, color: Colors.black),),
          ),
        ]
      )
    );
  }
}