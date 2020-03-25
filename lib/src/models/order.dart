import 'package:food_delivery_app/src/models/address.dart';
import 'package:food_delivery_app/src/models/food_order.dart';
import 'package:food_delivery_app/src/models/order_status.dart';
import 'package:food_delivery_app/src/models/payment.dart';
import 'package:food_delivery_app/src/models/user.dart';

class Order {
  String id;
  List<FoodOrder> foodOrders;
  OrderStatus orderStatus;
  double tax;
  String hint;
  DateTime dateTime;
  User user;
  Payment payment;
  Address deliveryAddress;

  Order();

  Order.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    tax = jsonMap['tax'] != null ? jsonMap['tax'].toDouble() : 0.0;
    hint = jsonMap['hint'].toString();
    orderStatus = jsonMap['order_status'] != null ? OrderStatus.fromJSON(jsonMap['order_status']) : new OrderStatus();
    dateTime = DateTime.parse(jsonMap['updated_at']);
    user = jsonMap['user'] != null ? User.fromJSON(jsonMap['user']) : new User();
    deliveryAddress =
        jsonMap['delivery_address'] != null ? Address.fromJSON(jsonMap['delivery_address']) : new Address();
    foodOrders = jsonMap['food_orders'] != null
        ? List.from(jsonMap['food_orders']).map((element) => FoodOrder.fromJSON(element)).toList()
        : [];
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["user_id"] = user?.id;
    map["order_status_id"] = orderStatus?.id;
    map["tax"] = tax;
    map["foods"] = foodOrders.map((element) => element.toMap()).toList();
    map["payment"] = payment.toMap();
    map["delivery_address_id"] = deliveryAddress.id;
    return map;
  }
}
