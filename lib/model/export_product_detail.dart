import 'package:intl/intl.dart';

class Export_product_detail {
  String? order_id;
  String? order_by;
  String? order_responsible_person;
  String? total;
  String? order_status;
  String? product_amount;
  String? product_name;
  String? product_image;
  String? product_price;
  String? order_date;
  String? product_promotion_name;
  String? product_promotion_value;
  String? simpletotal;
  String? discount;

  Export_product_detail({
    required this.order_id,
    required this.order_by,
    required this.order_responsible_person,
    required this.total,
    required this.order_status,
    required this.product_amount,
    required this.product_name,
    required this.product_image,
    required this.product_price,
    required this.order_date,
    required this.product_promotion_name,
    required this.product_promotion_value,
    required this.simpletotal,
    required this.discount,
  });

  factory Export_product_detail.fromJson(Map<String, dynamic> json) {
    return Export_product_detail(
      order_id: json['order_id'],
      order_by: json['order_by'],
      order_responsible_person: json['order_responsible_person'],
      total: json['total'],
      order_status: json['order_status'],
      product_amount: json['product_amount'],
      product_name: json['product_name'],
      product_image: json['product_image'],
      product_price: json['product_price'],
      order_date: json['order_date'],
      product_promotion_name: json['product_promotion_name'],
      product_promotion_value: json['product_promotion_value'],
      simpletotal: json['simpletotal'],
      discount: json['discount'],
    );
  }

  Map<String, dynamic> toJson() => {
        'order_id': order_id,
        'order_by': order_by,
        'order_responsible_person': order_responsible_person,
        'total': total,
        'order_status': order_status,
        'product_amount': product_amount,
        'product_name': product_name,
        'product_image': product_image,
        'product_price': product_price,
      };
}
