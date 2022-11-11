import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/components/search_place_delegate.dart';
import 'package:model_house/screens/interest.dart';
import 'package:model_house/services/http_helper.dart';

import '../components/btn_skip.dart';
import '../models/user.dart';

class PlaceApi extends StatefulWidget {
  User? user;
  PlaceApi(this.user, {super.key});

  @override
  State<PlaceApi> createState() => _PlaceApiState();
}

class _PlaceApiState extends State<PlaceApi> {
  int? placesCount;
  List? places;
  HttpHelper? helper;
  String input = 'Your Location';
  @override
  void initState() {
    helper = HttpHelper();
    initialize();

    super.initState();
  }

  Future initialize() async {
    places = List.empty();
    // places = await helper?.getGoogleAutocomplete('UPC');
    setState(() {
      placesCount = places?.length;
      places = places;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: FittedBox(
          child: Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Looking for a handyman nearby your location',
              maxLines: 2,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 100,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/planet_earth.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 5,
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(44, 44, 45, 0.92),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: TextField(
                    onTap: () async {
                      final results = await showSearch(
                        context: context,
                        delegate: SearchPlaceDelegate(),
                      );
                      setState(() {
                        input = results!;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.location_on_outlined,
                        color: Color.fromRGBO(255, 255, 255, 0.71),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      hintText: input,
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5)),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            next(context, widget.user, 'Interest'),
            const Text(
              'Skip',
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
