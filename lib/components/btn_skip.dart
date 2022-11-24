import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/screens/interest.dart';
import 'package:model_house/services/room_service.dart';
import 'package:model_house/services/service_service.dart';

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
        if (value == 'Interest') {
          // List<Area>? areas = await AreaService().getPostsByUserId(user!.id);
          AreaService().postPosts('Ceilings', false, user!.id);
          AreaService().postPosts('Door Services', false, user.id);
          AreaService().postPosts('Exterior', false, user.id);
          AreaService().postPosts('Floors', false, user.id);
          AreaService().postPosts('Drywall/ Walls', false, user.id);
          AreaService().postPosts('Windows', false, user.id);

          RoomService().postPosts('Attic', false, user.id);
          RoomService().postPosts('Deck & Patio', false, user.id);
          RoomService().postPosts('Bathroom', false, user.id);
          RoomService().postPosts('Garage', false, user.id);
          RoomService().postPosts('Bedroom', false, user.id);
          RoomService().postPosts('Office', false, user.id);

          ServiceService().postPosts('Installation', false, user.id);
          ServiceService().postPosts('Maintenance', false, user.id);
          ServiceService().postPosts('Painting', false, user.id);
          ServiceService().postPosts('Plumbing', false, user.id);
          ServiceService().postPosts('Repair', false, user.id);
          ServiceService().postPosts('Electrical', false, user.id);
        }
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
