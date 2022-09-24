import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/components/available_service.dart';
import 'package:model_house/models/service.dart';

class Search extends StatelessWidget {
  List<Service> services = [
    Service(
        icon: "icon",
        name: "Pintado",
        range: "PaitingExpert",
        work_hours: "9h ago"),
    Service(
        icon: "icon",
        name: "Pintado",
        range: "PaitingExpert",
        work_hours: "9h ago"),
    Service(
        icon: "icon",
        name: "Pintado",
        range: "PaitingExpert",
        work_hours: "9h ago"),
    Service(
        icon: "icon",
        name: "Pintado",
        range: "PaitingExpert",
        work_hours: "9h ago")
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 35, 20, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Available Services',
                  style: Theme.of(context).textTheme.headline1,
                ),
                searchInput(context)
              ]),
        ),
        AvailableService(services)
      ],
    );
  }
}

Widget searchInput(context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Container(
        decoration: BoxDecoration(
            color: Color(0XFF3e3e43), borderRadius: BorderRadius.circular(8.0)),
        child: TextFormField(
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontFamily: 'poppins-regular'),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Service, location or keywords',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
              size: 25.0,
            ),
            hintStyle: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'poppins-Medium'),
          ),
        )),
  );
}
