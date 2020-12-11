import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';

import '../utils/firestore_values.dart';
import '../utils/ad_types.dart';

/// Representation of an uploaded ad.
class Ad extends Equatable {
  final String id;
  final String title;
  final String description;
  final int price;
  final List images;
  final Uploader uploader;
  final AdType type;

  @override
  List<Object> get props => [
        id,
        title,
        description,
        price,
        images,
        uploader,
        type,
      ];

  Ad({
    this.id, //* Not required since ID is not known before adding to Firestore.
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.images,
    @required this.uploader,
    @required this.type,
  });

  /// Creates an instance from a DocumentSnapshot from Firestore.
  factory Ad.fromFirestoreObject(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    return Ad(
      id: snapshot.id,
      title: data[Ads.title],
      description: data[Ads.description],
      price: data[Ads.price],
      images: data[Ads.images],
      uploader: Uploader.fromFirestoreObject(data[Ads.uploader]),
      type: EnumToString.fromString(AdType.values, data[Ads.type]),
    );
  }

  /// Returns a map representation suitable for Firestore.
  Map<String, dynamic> toFirestoreObject() {
    return {
      Ads.title: title,
      Ads.description: description,
      Ads.price: price,
      Ads.images: images, // toSomething?
      Ads.uploader: uploader.toFirestoreObject(),
      Ads.type: EnumToString.convertToString(type),
    };
  }
}

/// Representation of a user that uploaded an ad.
class Uploader extends Equatable {
  final String id;
  final String name;
  final String image;

  @override
  List<Object> get props => [
        id,
        name,
        image,
      ];

  Uploader({
    @required this.id,
    @required this.name,
    @required this.image,
  });

  /// Creates an instance from a Firestore object.
  Uploader.fromFirestoreObject(Map<String, dynamic> obj)
      : this.id = obj[AdUploader.id],
        this.name = obj[AdUploader.name],
        this.image = obj[AdUploader.image];

  /// Returns a map representation suitable for Firestore.
  Map<String, dynamic> toFirestoreObject() {
    return {
      AdUploader.id: id,
      AdUploader.name: name,
      AdUploader.image: image,
    };
  }
}
