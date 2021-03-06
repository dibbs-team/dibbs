import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

import 'package:dibbs/models/ad.dart';
import 'package:dibbs/utils/firestore_values.dart';

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
        uploader: Uploader(
          id: '<uid>',
          name: '<name>',
          image: '<image_url>',
        ),
      );

      test(
        'Ad to Firestore object',
        () {
          expect(ad.toFirestoreObject(), {
            Ads.title: '<title>',
            Ads.description: '<description>',
            Ads.price: 42,
            Ads.uploader: {
              AdUploader.id: '<uid>',
              AdUploader.name: '<name>',
              AdUploader.image: '<image_url>',
            },
            Ads.dates: {
              DateRange.startDate: DateTime(2020, 12, 1),
              DateRange.endDate: DateTime(2020, 12, 24),
            },
            Ads.type: 'FIND',
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
        uploader: Uploader(
          id: '<uid>',
          name: '<name>',
          image: '<image_url3>',
        ),
      );

      test(
        'Ad to Firestore object',
        () {
          expect(ad.toFirestoreObject(), {
            Ads.title: '<title>',
            Ads.description: '<description>',
            Ads.price: 42,
            Ads.images: ['<image_url1>', '<image_url2>'],
            Ads.uploader: {
              AdUploader.id: '<uid>',
              AdUploader.name: '<name>',
              AdUploader.image: '<image_url3>',
            },
            Ads.type: 'LIST',
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
