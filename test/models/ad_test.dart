import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

import 'package:dibbs/models/ad.dart';
import 'package:dibbs/utils/firestore_values.dart' as fb;

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
            fb.Ad.title: '<title>',
            fb.Ad.description: '<description>',
            fb.Ad.price: 42,
            fb.Ad.uploader: {
              fb.AdUploader.id: '<uid>',
              fb.AdUploader.name: '<name>',
              fb.AdUploader.image: '<image_url>',
            },
            fb.Ad.dates: {
              fb.DateRange.startDate: DateTime(2020, 12, 1),
              fb.DateRange.endDate: DateTime(2020, 12, 24),
            },
            fb.Ad.type: 'FIND',
            fb.Ad.complete: true,
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
            fb.Ad.title: '<title>',
            fb.Ad.description: '<description>',
            fb.Ad.price: 42,
            fb.Ad.images: ['<image_url1>', '<image_url2>'],
            fb.Ad.uploader: {
              fb.AdUploader.id: '<uid>',
              fb.AdUploader.name: '<name>',
              fb.AdUploader.image: '<image_url3>',
            },
            fb.Ad.type: 'LIST',
            fb.Ad.complete: true,
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
