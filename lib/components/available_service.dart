import 'package:flutter/material.dart';
import 'package:model_house/models/service.dart';

class AvailableService extends StatelessWidget {
  List<Service> services;
  AvailableService(this.services);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return item_service(services[index]);
        },
      ),
    );
  }

  Widget item_service(Service service) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xff161A1D)),
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child: Icon(
              Icons.kitchen,
              size: 35.0,
              color: Color(0xffE43848),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins-medium',
                      fontSize: 17),
                ),
                Text(
                  service.range,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins-ligth',
                      fontSize: 15),
                ),
                Text(
                  service.work_hours,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins-regular',
                      fontSize: 10.0),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.white,
              )
            ]),
          )
        ],
      ),
    );
  }
}
