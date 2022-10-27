import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/screens/interest.dart';

import '../models/user.dart';
import '../screens/principal_view.dart';

Widget next(BuildContext context, User? user, String value) {
  return Ink(
    decoration: const ShapeDecoration(
      color: Colors.amber,
      shape: CircleBorder(),
    ),
    child: IconButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return value == 'PrincipalView'
                  ? PrincipalView(user)
                  : Interest(user);
            },
          ),
        );
      },
      icon: const Icon(Icons.arrow_forward_ios_rounded),
      color: value == 'PrincipalView' ? Colors.black : Colors.white,
    ),
  );
}
