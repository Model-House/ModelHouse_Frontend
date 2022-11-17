import 'package:flutter/material.dart';
import 'package:model_house/screens/signin.dart';
import 'package:model_house/screens/signupchoice.dart';
import 'package:model_house/services/notification_service.dart';

class SessionOptions extends StatefulWidget {
  const SessionOptions({super.key});

  @override
  State<SessionOptions> createState() => _SessionOptionsState();
}

class _SessionOptionsState extends State<SessionOptions> {
  @override
  void initState() {
    super.initState();
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
        child: const Text(
          "Sign In to continue",
          style: TextStyle(
              color: Colors.white, fontSize: 48.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));
  }

  Widget buttons() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const SignUpChoice();
                    },
                  ),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          Container(
            width: 120,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const SignIn();
                    },
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
