import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(5, 30, 5, 20),
          child: _user(context),
        ),
        _post(context),
        _shopping(context),
        _log_out(context)
      ],
    );
  }

  Widget _post(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
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
                color: Color(0XFF161A1D),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color(0xffCFDBD5), width: 3.5)),
            child: Column(
              children: <Widget>[
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xffCFDBD5), width: 3.5))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: Color(0xffCFDBD5),
                            size: 30,
                          ),
                          Text('Create Post',
                              style: TextStyle(
                                  color: Color(0xffCFDBD5), fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xffCFDBD5), width: 3.5))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.post_add_rounded,
                            color: Color(0xffCFDBD5),
                            size: 30,
                          ),
                          Text('Your Post',
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
                    padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.payment_rounded,
                          color: Color(0xffCFDBD5),
                          size: 30,
                        ),
                        Text('Pagar con',
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

  Widget _shopping(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
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
                color: Color(0XFF161A1D),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color(0xffCFDBD5), width: 3.5)),
            child: Column(
              children: <Widget>[
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.white, width: 3.5))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.post_add_sharp,
                            color: Color(0xffCFDBD5),
                            size: 30,
                          ),
                          Text('Deals',
                              style: TextStyle(
                                  color: Color(0xffCFDBD5), fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xffCFDBD5), width: 3.5))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.shopping_cart_checkout,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text('Your Orders',
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
                    padding: EdgeInsets.fromLTRB(10, 9, 10, 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.payment,
                          color: Color(0xffCFDBD5),
                          size: 30,
                        ),
                        Text('Payments methods',
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
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Color(0XFF161A1D),
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Color(0xffE0E1DD), width: 3.5)),
          child: Row(
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 60.0,
                  )),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: const <Widget>[
                      Text(
                        'Adrian Esqueiros',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'archivo',
                            fontSize: 18.0),
                      ),
                      Text(
                        '@AdrianEsqueiros',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'archivo',
                            fontSize: 16.0),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }

  Widget _log_out(context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: MaterialButton(
          onPressed: () {},
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xffE43848),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Icon(
                      Icons.login_outlined,
                      color: Colors.white,
                      size: 28,
                    )),
                Text(
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
