import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/models/order.dart';
import 'package:model_house/screens/date_order.dart';
import 'package:model_house/services/order_service.dart';

import '../models/post.dart';
import '../models/user.dart';

class ListOrders extends StatefulWidget {
  final User? user;
  const ListOrders(this.user, {Key? key}) : super(key: key);

  @override
  State<ListOrders> createState() => _ListOrdersState();
}

class _ListOrdersState extends State<ListOrders> {
  HttpOrder? _httpOrder;
  List? orders;

  @override
  void initState() {
    _httpOrder = HttpOrder();
    initialize();
    super.initState();
  }

  Future initialize() async {
    orders = List.empty();
    orders = await _httpOrder?.getOrderByUserId(widget.user!.id.toString());

    print("algo1");
    setState(() {
      orders = orders;
      print("algo2");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("Your Orders"),
        backgroundColor: const Color(0xff007AFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: orders?.length,
            itemBuilder: ((context, index) {
              return MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DateOrder()));
                },
                child: Card(
                  child: ListTile(
                    title: Text(orders?[index].title),
                    subtitle: Text(orders?[index].description),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
