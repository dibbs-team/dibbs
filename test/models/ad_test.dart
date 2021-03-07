import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

import '../../lib/models/user_stub.dart';
import '../../lib/models/ad.dart';
import '../../lib/utils/firestore_values.dart' as fs;

void main() {
  group(
    'Find ad convertion',
    () {
      final ad = FindAd(
        id: '<id>',
        title: '<title>',
        description: '<description>',
        price: 42,
        dates: DateTimeRange(
          start: DateTime(2020, 12, 1),
          end: DateTime(2020, 12, 24),
        ),
        uploader: UserStub(
          id: '<uid>',
          name: '<name>',
          image: '<image_url>',
        ),
      );

      test(
        'Ad to Firestore object',
        () {
          expect(ad.toFirestoreObject(), {
            fs.Ad.title: '<title>',
            fs.Ad.description: '<description>',
            fs.Ad.price: 42,
            fs.Ad.uploader: {
              fs.UserStub.id: '<uid>',
              fs.UserStub.name: '<name>',
              fs.UserStub.image: '<image_url>',
            },
            fs.Ad.dates: {
              fs.DateRange.startDate: DateTime(2020, 12, 1),
              fs.DateRange.endDate: DateTime(2020, 12, 24),
            },
            fs.Ad.type: 'FIND',
            fs.Ad.complete: true,
          });
        },
      );

      // test(
      //   'Firestore object to Ad',
      //   () async {
      //     // Add ad to Firestore.
      //     final instance = MockFirestoreInstance();
      //     await instance
      //         .collection(Collection.ads)
      //         .doc(ad.id)
      //         .set(ad.toFirestoreObject());

      //     // Get ad from Firestore.
      //     final snapshot =
      //         await instance.collection(Collection.ads).doc('<id>').get();
      //     expect(Ad.fromFirestoreObject(snapshot), ad);
      //   },
      // );
    },
  );

  group(
    'List ad convertion',
    () {
      final ad = ListAd(
        id: '<id>',
        title: '<title>',
        description: '<description>',
        price: 42,
        images: ['<image_url1>', '<image_url2>'],
        uploader: UserStub(
          id: '<uid>',
          name: '<name>',
          image: '<image_url3>',
        ),
      );

      test(
        'Ad to Firestore object',
        () {
          expect(ad.toFirestoreObject(), {
            fs.Ad.title: '<title>',
            fs.Ad.description: '<description>',
            fs.Ad.price: 42,
            fs.Ad.images: ['<image_url1>', '<image_url2>'],
            fs.Ad.uploader: {
              fs.UserStub.id: '<uid>',
              fs.UserStub.name: '<name>',
              fs.UserStub.image: '<image_url3>',
            },
            fs.Ad.type: 'LIST',
            fs.Ad.complete: true,
          });
        },
      );

      // test(
      //   'Firestore object to Ad',
      //   () async {
      //     // Add ad to Firestore.
      //     final instance = MockFirestoreInstance();
      //     await instance
      //         .collection(Collection.ads)
      //         .doc(ad.id)
      //         .set(ad.toFirestoreObject());

      //     // Get ad from Firestore.
      //     final snapshot =
      //         await instance.collection(Collection.ads).doc('<id>').get();
      //     expect(Ad.fromFirestoreObject(snapshot), ad);
      //   },
      // );
    },
  );
}
