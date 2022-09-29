
import 'package:flutter/material.dart';
import 'package:model_house/screens/signin.dart';
import 'package:model_house/screens/signup.dart';

class SignUpChoice extends StatefulWidget {
  const SignUpChoice({super.key});

  @override
  State<SignUpChoice> createState() => _SignUpChoiceState();
}

class _SignUpChoiceState extends State<SignUpChoice> {
  bool condition = false;

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
          buttonSignUpEmail(),
          const SizedBox(
            height: 10,
          ),
          const Text('OR', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          const SizedBox(
            height: 10,
          ),
          buttonSignUpGoogle(),
          haveAccount(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
  );
}

  Container title() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ));
  }

 Container buttonSignUpEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width - 10,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
              builder: (BuildContext context) {
                return const SignUp();
              },
              ),
              );
        }, 
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
          child: const Text('Sign Up with Email', 
          style: TextStyle(fontSize: 20, color: Colors.black),),
      ),
    );
  }

  Container buttonSignUpGoogle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width - 10,
      child: ElevatedButton(
        onPressed: () {},
          child: const Text('Sign Up with Google',
          style: TextStyle(fontSize: 20),),
      ),
    );
  }

  Container haveAccount() {
    return Container( 
      margin: EdgeInsets.symmetric(horizontal: 20),
    child: Row(children: [
      Text('Already have an account? ',
      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
      GestureDetector(
      onTap: () {Navigator.of(context).push(
              MaterialPageRoute(
              builder: (BuildContext context) {
                return const SignIn();
              },
            ),
          );},
      child: Text('Sign in',
      style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),),
      ),
      
    ])
    );
  }
}
