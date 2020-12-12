import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';

import '../utils/firestore_values.dart';
import '../utils/ad_types.dart';

abstract class Ad extends Equatable {
  final String id;
  final String title;
  final String description;
  final int price;
  final Uploader uploader;
  final AdType type;

  Ad({
    this.id, //* Not required since ID is not known before adding to Firestore.
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.uploader,
    @required this.type,
  });

  @override
  List<Object> get props => [
        id,
        title,
        description,
        price,
        uploader,
        type,
      ];

  /// Returns a map representation suitable for Firestore.
  Map<String, dynamic> toFirestoreObject();

  /// Creates an instance from a DocumentSnapshot from Firestore.
  factory Ad.fromFirestoreObject(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    final type = EnumToString.fromString(AdType.values, data[Ads.type]);

    switch (type) {
      case AdType.FIND:
        return FindAd(
          id: snapshot.id,
          title: data[Ads.title],
          description: data[Ads.description],
          price: data[Ads.price],
          uploader: Uploader.fromFirestoreObject(data[Ads.uploader]),
          dates: DateTimeRange(
            start: data[Ads.dates][DateRange.startDate].toDate(),
            end: data[Ads.dates][DateRange.endDate].toDate(),
          ),
        );
      case AdType.LIST:
        return ListAd(
          id: snapshot.id,
          title: data[Ads.title],
          description: data[Ads.description],
          price: data[Ads.price],
          uploader: Uploader.fromFirestoreObject(data[Ads.uploader]),
          images: data[Ads.images],
        );
      default:
        throw TypeError();
    }
  }
}

class FindAd extends Ad {
  final DateTimeRange dates;

  FindAd({
    id,
    @required title,
    @required description,
    @required price,
    @required uploader,
    @required this.dates,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          uploader: uploader,
          type: AdType.FIND,
        );

  @override
  List<Object> get props => super.props + [dates];

  @override
  Map<String, dynamic> toFirestoreObject() {
    return {
      Ads.title: title,
      Ads.description: description,
      Ads.price: price,
      Ads.uploader: uploader.toFirestoreObject(),
      Ads.dates: {
        DateRange.startDate: dates.start,
        DateRange.endDate: dates.end,
      },
      Ads.type: EnumToString.convertToString(AdType.FIND),
    };
  }
}

class ListAd extends Ad {
  final List images;

  ListAd({
    id,
    @required title,
    @required description,
    @required price,
    @required uploader,
    @required this.images,
  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          uploader: uploader,
          type: AdType.LIST,
        );

  @override
  List<Object> get props => super.props + [images];

  @override
  Map<String, dynamic> toFirestoreObject() {
    return {
      Ads.title: title,
      Ads.description: description,
      Ads.price: price,
      Ads.uploader: uploader.toFirestoreObject(),
      Ads.images: images,
      Ads.type: EnumToString.convertToString(AdType.LIST),
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
