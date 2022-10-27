import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1C1C1C),
      body: body(),
      bottomNavigationBar: navigationBar(),
      );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      title(),
      const SizedBox(
            height: 20,
          ),
      order(),
      const SizedBox(
            height: 20,
          ),
      description(),
      const SizedBox(
        height: 20,
      ),
      titleService(),
      serviceDescription(),
      const SizedBox(
            height: 20,
          ),
      titleSummary(),
      summaryDescription(),
      const SizedBox(
            height: 20,
          ),
      titlePaymentMethod(),
      const SizedBox(
            height: 10,
          ),
      paymentDescription(),
      const SizedBox(
            height: 20,
          ),
      titleLocation(),
      const SizedBox(
            height: 10,
          ),
      locationDescription(),
      const SizedBox(
            height: 150,
          ),
    ]);
  }

  Container title() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
      Text("Order Detail",
      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "poppins-medium")),
    ]));
  }

  Container titleService() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
      Text("Service",
      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "poppins-regular")),
    ])
    );
  }

  Container titleSummary(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
      Text("Summary",
      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "poppins-regular")),
    ])
    );
  }

  Widget navigationBar() {
    return BottomNavigationBar(
      currentIndex: 4,
      backgroundColor: Color(0XFF1C1C1C),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0XFFFF0080),
      unselectedItemColor: Colors.white,
      iconSize: 30.0,
      selectedFontSize: 12.0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'message'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: 'notification'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'menu'),
      ],
    );
  }

  Container description() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 65),
      child: Column(children: [
      Text("Empastado y pintado de inmuebles, tarifa de las paredes: \$15 x m2 y techo \$18 x m2",
      style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold,  fontFamily: "poppins-regular"),)
      ],),
    );
  }

  Container serviceDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        const SizedBox(
        height: 10,
      ),
      Text("Pintado del inmueble por...                                                            300 m2",
      style: TextStyle(color: Colors.white, fontSize: 11,  fontFamily: "poppins-regular"),),
      const SizedBox(
        height: 10,
      ),
      Text("Solo paredes                                                                                             \$15",
      style: TextStyle(color: Colors.white, fontSize: 11,  fontFamily: "poppins-regular"),),
      const SizedBox(
        height: 10,
      ),
      ],
      ),
    );
  }

  Container summaryDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        const SizedBox(
        height: 10,
      ),
      Text("Subtotal                                                                                                 \$4500",
      style: TextStyle(color: Colors.white, fontSize: 11,  fontFamily: "poppins-regular"),),
      const SizedBox(
        height: 10,
      ),
      Text("Fee                                                                                                               \$90",
      style: TextStyle(color: Colors.white, fontSize: 11,  fontFamily: "poppins-regular"),),
      const SizedBox(
        height: 10,
      ),
      Text("Total                                                                                                       \$4590",
      style: TextStyle(color: Colors.white, fontSize: 11,  fontFamily: "poppins-regular", fontWeight: FontWeight.bold),),
      ],),
    );
  }

  Container titlePaymentMethod(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
      Text("Payment method",
      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold,  fontFamily: "poppins-regular")),
    ])
    );
  }

  Container titleLocation(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
      Text("Location",
      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold,  fontFamily: "poppins-regular")),
    ])
    );
  }

  Container paymentDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Container(
          width: 15,
          height: 17.7,
          child: Image(image: AssetImage("images/paypalLogo.png"), fit: BoxFit.cover,),),
          Text("      adrianesqueiros@gmail.com",
          style: TextStyle(color: Colors.white, fontSize: 11,  fontFamily: "poppins-regular"))
      ]),
    );
  }

  Container locationDescription() {
      return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
      Text("Calle Piura 138, Miraflores, Lima, Perú",
      style: TextStyle(color: Colors.white, fontSize: 11,  fontFamily: "poppins-regular")),
    ])
    );
  }

  Container order() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Container(
          width: 64,
          height: 64,
          child: Image(image: const AssetImage("images/rodillo.PNG"), fit: BoxFit.cover,),),
          Column(children: [
            Text("      Pintado",
            style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold,  fontFamily: "poppins-regular")),
            Text("      PaintingExpert",
            style: TextStyle(color: Colors.white, fontSize: 11,  fontFamily: "poppins-regular")),
            Text("      Surquillo, Lima",
            style: TextStyle(color: Colors.white, fontSize: 11,  fontFamily: "poppins-regular")),
          ],)
      ]),
    );
  }
}