import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:model_house/models/area.dart';
import 'package:model_house/screens/area_option_page.dart';
import 'package:model_house/screens/principal_view.dart';
import 'package:model_house/screens/room_option_page.dart';
import 'package:model_house/screens/service_option_page.dart';
import 'package:model_house/services/area_service.dart';

import '../components/btn_skip.dart';
import '../models/user.dart';

class Interest extends StatelessWidget {
  User? user;
  Interest(this.user);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: const Color(0XFF1C1C1C),
          accentColor: const Color(0XFF161A1D),
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontFamily: 'poppins-medium',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
      home: Scaffold(
        backgroundColor: const Color(0xff1C1C1C),
        appBar: AppBar(
          primary: false,
          title: Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
            height: 110,
            child: const Text(
              'Choose your services by ...',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ),
          backgroundColor: const Color(0xff1C1C1C),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AreaPage(user),
            RoomPage(user),
            ServicePage(user),
            next(context, user, 'PrincipalView')
          ],
        ),
      ),
    );
  }
}

class AreaPage extends StatelessWidget {
  final User? user;
  const AreaPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xffE94545),
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: InkWell(
          splashColor: const Color(0xffE94545).withAlpha(50),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return AreaOptionPage(user);
                },
              ),
            );
          },
          child: SizedBox(
            width: 200,
            height: 150,
            child: Column(
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromRGBO(250, 244, 222, 0.89),
                    shape: CircleBorder(),
                  ),
                  child: const SizedBox(
                    height: 110,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 70,
                      color: Color(0xffE94545),
                    ),
                  ),
                ),
                const Text('Area'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoomPage extends StatelessWidget {
  final User? user;
  const RoomPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xff457DE9),
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: InkWell(
          splashColor: const Color(0xff457DE9).withAlpha(50),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return RoomOptionPage(user);
                },
              ),
            );
          },
          child: SizedBox(
            width: 200,
            height: 150,
            child: Column(
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromRGBO(250, 244, 222, 0.89),
                    shape: CircleBorder(),
                  ),
                  child: const SizedBox(
                    height: 110,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 70,
                      color: Color(0xff457DE9),
                    ),
                  ),
                ),
                const Text('Room'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServicePage extends StatelessWidget {
  final User? user;
  const ServicePage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xff74806D),
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: InkWell(
          splashColor: const Color(0xff74806D).withAlpha(50),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return ServiceOptionPage(user);
                },
              ),
            );
          },
          child: SizedBox(
            width: 200,
            height: 150,
            child: Column(
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromRGBO(250, 244, 222, 0.89),
                    shape: CircleBorder(),
                  ),
                  child: const SizedBox(
                    height: 110,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 70,
                      color: Color(0xff74806D),
                    ),
                  ),
                ),
                const Text('Service'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
