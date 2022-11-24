import 'package:flutter/material.dart';
import 'package:model_house/provider/google_sign_in.dart';
import 'package:model_house/screens/editProfile.dart';
import 'package:model_house/screens/formPost.dart';
import 'package:model_house/screens/list_orders.dart';
import 'package:model_house/screens/signin.dart';
import 'package:model_house/screens/yourPost.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../services/security_service.dart';

class Menu extends StatefulWidget {
  User? user;
  Menu(this.user, {super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  HttpSecurity? _httpSecurity;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 30, 5, 20),
          child: _user(context),
        ),
        _post(context),
        _shopping(context),
        _log_out(context)
      ],
    );
  }

  @override
  void initState() {
    _httpSecurity = HttpSecurity();
    initialize();
    super.initState();
  }

  Future initialize() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isChange') == true) {
      widget.user = await _httpSecurity?.getUser();
      prefs.setBool('isChange', false);
    }
  }

  Widget _post(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Post',
            style: TextStyle(
                color: Color(0xffCFDBD5),
                fontSize: 27,
                fontFamily: 'poppins-medium',
                fontWeight: FontWeight.w700),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0XFF161A1D),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: const Color(0xffCFDBD5), width: 3.5)),
            child: Column(
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FormPost(widget.user)));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xffCFDBD5), width: 3.5))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 9, 10, 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(
                            Icons.add_circle,
                            color: Color(0xffCFDBD5),
                            size: 30,
                          ),
                          const Text('Create Post',
                              style: TextStyle(
                                  color: Color(0xffCFDBD5), fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => YourPost(widget.user)));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xffCFDBD5), width: 3.5))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 9, 10, 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(
                            Icons.post_add_rounded,
                            color: Color(0xffCFDBD5),
                            size: 30,
                          ),
                          const Text('Your Post',
                              style: TextStyle(
                                  color: Color(0xffCFDBD5), fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 9, 10, 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Icon(
                          Icons.payment_rounded,
                          color: const Color(0xffCFDBD5),
                          size: 30,
                        ),
                        // ignore: prefer_const_constructors
                        Text('Pagar con',
                            style: const TextStyle(
                                color: Color(0xffCFDBD5), fontSize: 18)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _shopping(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shopping',
            style: TextStyle(
                color: Color(0xffCFDBD5),
                fontSize: 27,
                fontFamily: 'poppins-medium',
                fontWeight: FontWeight.w700),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0XFF161A1D),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: const Color(0xffCFDBD5), width: 3.5)),
            child: Column(
              children: <Widget>[
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.white, width: 3.5))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 9, 10, 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(
                            Icons.post_add_sharp,
                            color: Color(0xffCFDBD5),
                            size: 30,
                          ),
                          // ignore: prefer_const_constructors
                          Text('Deals',
                              style: const TextStyle(
                                  color: Color(0xffCFDBD5), fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListOrders(widget.user)));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xffCFDBD5), width: 3.5))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 9, 10, 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(
                            Icons.shopping_cart_checkout,
                            color: Colors.white,
                            size: 30,
                          ),
                          const Text('Your Orders',
                              style: TextStyle(
                                  color: Color(0xffCFDBD5), fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 9, 10, 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Icons.payment,
                          color: Color(0xffCFDBD5),
                          size: 30,
                        ),
                        const Text('Payments methods',
                            style: TextStyle(
                                color: Color(0xffCFDBD5), fontSize: 18)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _user(context) {
    return MaterialButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return EditProfile(widget.user);
              },
            ),
          );
        },
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0XFF161A1D),
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: const Color(0xffE0E1DD), width: 3.5)),
            child: Row(
              children: <Widget>[
                widget.user!.image == "image"
                    ? const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: 60.0,
                        ))
                    : Image.network(widget.user!.image, width: 60, height: 60),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          widget.user?.username == null
                              ? ''
                              : widget.user!.username,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'archivo',
                              fontSize: 18.0),
                        ),
                        Text(
                          widget.user?.email == null ? '' : widget.user!.email,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'archivo',
                              fontSize: 16.0),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

  Future logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
    prefs.remove('username');
    prefs.remove('email');
  }

  Widget _log_out(context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: MaterialButton(
          onPressed: () {
            logOut();
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logOut();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const SignIn();
                },
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xffE43848),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(15),
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(children: [
                const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Icon(
                      Icons.login_outlined,
                      color: Colors.white,
                      size: 28,
                    )),
                const Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ]),
            ),
          ),
        ));
  }
}
