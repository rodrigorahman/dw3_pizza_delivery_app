import 'package:dw3_pizza_delivery_app/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPanel extends StatelessWidget {
  final formatNumberPrice = NumberFormat.currency(
    name: 'R\$ ',
    locale: 'pt_BR',
    decimalDigits: 2,
  );
  final OrderModel order;
  HistoryPanel(this.order, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Pedido ${order.id}'),
      children: [
        Divider(),
        ...order.items.map((o) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(o.item.name), Text(formatNumberPrice.format(o.item.price))],
            ),
          );
        }).toList(),
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total'),
              Text(formatNumberPrice.format(_calculateTotalOrder())),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  double _calculateTotalOrder() => order.items.fold(
        0,
        (total, o) => total += o.item.price,
      );
}
