
import 'dart:convert';

import 'package:dw3_pizza_delivery_app/models/menu_item_model.dart';

class OrderItemModel {
  int id;
  MenuItemModel item;
  OrderItemModel({
    this.id,
    this.item,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item': item?.toMap(),
    };
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return OrderItemModel(
      id: map['id'] ?? 0,
      item: MenuItemModel.fromMap(map['item']) ?? MenuItemModel(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItemModel.fromJson(String source) => OrderItemModel.fromMap(json.decode(source));
}
