// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductDetails {
  final double tva;
  final List<String> tags;
  final List<String> flags;
  final String review;
  final String mustKnow;
  final String fabricant;
  final String longReason;
  ProductDetails({
    required this.tva,
    required this.tags,
    required this.flags,
    required this.review,
    required this.mustKnow,
    required this.fabricant,
    required this.longReason,
  });

  ProductDetails copyWith({
    double? tva,
    List<String>? tags,
    List<String>? flags,
    String? review,
    String? mustKnow,
    String? fabricant,
    String? longReason,
  }) {
    return ProductDetails(
      tva: tva ?? this.tva,
      tags: tags ?? this.tags,
      flags: flags ?? this.flags,
      review: review ?? this.review,
      mustKnow: mustKnow ?? this.mustKnow,
      fabricant: fabricant ?? this.fabricant,
      longReason: longReason ?? this.longReason,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tva': tva,
      'tags': tags,
      'flags': flags,
      'review': review,
      'mustKnow': mustKnow,
      'fabricant': fabricant,
      'longReason': longReason,
    };
  }

  factory ProductDetails.fromMap(Map<String, dynamic> map) {
    return ProductDetails(
      tva: map['tva'].toDouble(),
      tags: List<String>.from(map['tags'].map((e) => e.toString())),
      flags: List<String>.from(map['flags'].map((e) => e.toString())),
      review: map['review'] as String,
      mustKnow: map['mustKnow'] as String,
      fabricant: map['fabricant'] as String,
      longReason: map['longReason'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetails.fromJson(String source) =>
      ProductDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDetails(tva: $tva, tags: $tags, flags: $flags, review: $review, mustKnow: $mustKnow, fabricant: $fabricant, longReason: $longReason)';
  }

  @override
  bool operator ==(covariant ProductDetails other) {
    if (identical(this, other)) return true;

    return other.tva == tva &&
        listEquals(other.tags, tags) &&
        listEquals(other.flags, flags) &&
        other.review == review &&
        other.mustKnow == mustKnow &&
        other.fabricant == fabricant &&
        other.longReason == longReason;
  }

  @override
  int get hashCode {
    return tva.hashCode ^
        tags.hashCode ^
        flags.hashCode ^
        review.hashCode ^
        mustKnow.hashCode ^
        fabricant.hashCode ^
        longReason.hashCode;
  }
}
