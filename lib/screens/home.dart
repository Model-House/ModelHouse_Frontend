import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/components/navigation.dart';

class Home extends StatelessWidget {
  int index = 0;
  String name = "hols";
  Icon _icon = Icon(
    Icons.bathroom,
    color: Color(0XFFF5CB5C),
    size: 45,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, 35, 15, 15),
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0XFF3e3e43),
                  borderRadius: BorderRadius.circular(8.0)),
              child: TextFormField(
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontFamily: 'poppins-regular'),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search on Model House',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  hintStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontFamily: 'poppins-light'),
                ),
              )),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: CarouselSlider(
            options: CarouselOptions(
                enableInfiniteScroll: true,
                height: 60,
                viewportFraction: 1,
                autoPlay: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlayAnimationDuration: Duration(seconds: 4)),
            items: [
              Container(
                  padding: EdgeInsets.all(0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MaterialButton(onPressed: () {}, child: this._icon),
                        MaterialButton(onPressed: () {}, child: this._icon),
                        MaterialButton(onPressed: () {}, child: this._icon),
                      ])),
              Container(
                  padding: EdgeInsets.all(0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MaterialButton(onPressed: () {}, child: this._icon),
                        MaterialButton(onPressed: () {}, child: this._icon),
                        MaterialButton(onPressed: () {}, child: this._icon),
                      ])),
              Container(
                  padding: EdgeInsets.all(0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MaterialButton(onPressed: () {}, child: this._icon),
                        MaterialButton(onPressed: () {}, child: this._icon),
                        MaterialButton(onPressed: () {}, child: this._icon),
                      ])),
            ],
          ),
        )
      ],
    );
  }
}
