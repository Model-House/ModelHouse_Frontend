import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/screens/home.dart';
import 'package:model_house/screens/interest.dart';

import '../models/area.dart';
import '../models/user.dart';
import '../screens/principal_view.dart';
import '../services/area_service.dart';

Widget next(BuildContext context, User? user, String value) {
  return Ink(
    decoration: const ShapeDecoration(
      color: Colors.amber,
      shape: CircleBorder(),
    ),
    child: IconButton(
      onPressed: () {
        List<Area> areas =
            AreaService().getPostsByUserId(user!.id) as List<Area>;
        if (areas.length <= 6) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Home();
              },
            ),
          );
        } else if (value == 'Interest') {
          AreaService().postPosts('Ceilings', false, user.id);
          AreaService().postPosts('Door Services', false, user.id);
          AreaService().postPosts('Exterior', false, user.id);
          AreaService().postPosts('Floors', false, user.id);
          AreaService().postPosts('Drywall/ Walls', false, user.id);
          AreaService().postPosts('Windows', false, user.id);
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return value == 'PrincipalView'
                    ? PrincipalView(user)
                    : Interest(user);
              },
            ),
          );
        }
      },
      icon: const Icon(Icons.arrow_forward_ios_rounded),
      color: value == 'PrincipalView' ? Colors.black : Colors.white,
    ),
  );
}
