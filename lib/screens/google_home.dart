import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/screens/place_api.dart';
import 'package:model_house/screens/sessionoptions.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

Widget LoggedIn(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
    title: Text('Logged In'),
    centerTitle: true,
    actions: [
      TextButton(
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logOut();
          },
          child: const Text(
            'LogOut',
            style: TextStyle(color: Colors.amber),
          ))
    ],
  ));
}
