import 'package:flutter/material.dart';

class Order {
  final String _size;
  final String _total;
  final String _flavor;
  var datetime = DateTime.now().toString();

  Order(this._size, this._flavor, this._total);

  @override
  String toString(){
    return ("$datetime \nSize: $_size \nFlavor: $_flavor \nTotal: \$$_total");
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key, required this.orders}) : super(key: key);
  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Past Orders",),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(orders[index].toString()),
              );
            },
          ),
        ),
      ),
    );
  }
}