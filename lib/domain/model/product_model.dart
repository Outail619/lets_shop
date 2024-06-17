// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lets_shop/domain/model/product_detail_model.dart';

class Product {
  final int prixRatio;
  final int availableUnits;
  final int id;
  final String title;
  final int price;
  final String? barcode;
  final String reason;
  final String producer;
  final String? vatrate;
  final String imageUrl;
  final ProductDetails productDetails;
  Product({
    required this.prixRatio,
    required this.availableUnits,
    required this.id,
    required this.title,
    required this.price,
    required this.barcode,
    required this.reason,
    required this.producer,
    required this.vatrate,
    required this.imageUrl,
    required this.productDetails,
  });

  Product copyWith({
    int? prixRatio,
    int? availableUnits,
    int? id,
    String? title,
    int? price,
    String? barcode,
    String? reason,
    String? producer,
    String? vatrate,
    String? imageUrl,
    ProductDetails? productDetails,
  }) {
    return Product(
      prixRatio: prixRatio ?? this.prixRatio,
      availableUnits: availableUnits ?? this.availableUnits,
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      barcode: barcode ?? this.barcode,
      reason: reason ?? this.reason,
      producer: producer ?? this.producer,
      vatrate: vatrate ?? this.vatrate,
      imageUrl: imageUrl ?? this.imageUrl,
      productDetails: productDetails ?? this.productDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prixRatio': prixRatio,
      'availableUnits': availableUnits,
      'id': id,
      'title': title,
      'price': price,
      'barcode': barcode,
      'reason': reason,
      'producer': producer,
      'vatrate': vatrate,
      'imageUrl': imageUrl,
      'productDetails': productDetails.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      prixRatio: map['prixRatio'] as int,
      availableUnits: map['availableUnits'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as int,
      barcode: map['barcode'] != null ? map['barcode'] as String : null,
      reason: map['reason'] as String,
      producer: map['producer'] as String,
      vatrate: map['vatrate'] != null ? map['vatrate'] as String : null,
      imageUrl: map['image_url'] as String,
      productDetails: ProductDetails.fromMap(
          map['product_details'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(prixRatio: $prixRatio, availableUnits: $availableUnits, id: $id, title: $title, price: $price, barcode: $barcode, reason: $reason, producer: $producer, vatrate: $vatrate, imageUrl: $imageUrl, productDetails: $productDetails)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.prixRatio == prixRatio &&
        other.availableUnits == availableUnits &&
        other.id == id &&
        other.title == title &&
        other.price == price &&
        other.barcode == barcode &&
        other.reason == reason &&
        other.producer == producer &&
        other.vatrate == vatrate &&
        other.imageUrl == imageUrl &&
        other.productDetails == productDetails;
  }

  @override
  int get hashCode {
    return prixRatio.hashCode ^
        availableUnits.hashCode ^
        id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        barcode.hashCode ^
        reason.hashCode ^
        producer.hashCode ^
        vatrate.hashCode ^
        imageUrl.hashCode ^
        productDetails.hashCode;
  }
}
