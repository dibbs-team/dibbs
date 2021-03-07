import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';

import '../utils/firestore_values.dart' as fs;
import '../utils/ad_types.dart';
import 'user_stub.dart';

abstract class Ad extends Equatable {
  final String id;
  final String title;
  final String description;
  final int price;
  final UserStub uploader;
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
    final type = EnumToString.fromString(AdType.values, data[fs.Ad.type]);

    switch (type) {
      case AdType.FIND:
        return FindAd(
          id: snapshot.id,
          title: data[fs.Ad.title],
          description: data[fs.Ad.description],
          price: data[fs.Ad.price],
          uploader: UserStub.fromFirestoreObject(data[fs.Ad.uploader]),
          dates: DateTimeRange(
            start: data[fs.Ad.dates][fs.DateRange.startDate].toDate(),
            end: data[fs.Ad.dates][fs.DateRange.endDate].toDate(),
          ),
        );
      case AdType.LIST:
        return ListAd(
          id: snapshot.id,
          title: data[fs.Ad.title],
          description: data[fs.Ad.description],
          price: data[fs.Ad.price],
          uploader: UserStub.fromFirestoreObject(data[fs.Ad.uploader]),
          images: data[fs.Ad.images],
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
      fs.Ad.title: title,
      fs.Ad.description: description,
      fs.Ad.price: price,
      fs.Ad.uploader: uploader.toFirestoreObject(),
      fs.Ad.dates: {
        fs.DateRange.startDate: dates.start,
        fs.DateRange.endDate: dates.end,
      },
      fs.Ad.type: EnumToString.convertToString(AdType.FIND),
      fs.Ad.complete: true,
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
      fs.Ad.title: title,
      fs.Ad.description: description,
      fs.Ad.price: price,
      fs.Ad.uploader: uploader.toFirestoreObject(),
      fs.Ad.images: images,
      fs.Ad.type: EnumToString.convertToString(AdType.LIST),
      fs.Ad.complete: true,
    };
  }
}
