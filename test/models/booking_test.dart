import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

import '../../lib/utils/firestore_values.dart' as fs;
import '../../lib/models/user_stub.dart';
import '../../lib/models/ad_stub.dart';
import '../../lib/models/booking.dart';

void main() {
  group(
    'Booking convertion',
    () {
      final booking = Booking(
        id: '<bid1>',
        ad: FindAdStub(
          id: '<aid1>',
          uploader: UserStub(
            id: '<uid1>',
            name: '<name>',
            image: '<image_url2>',
          ),
          title: '<title>',
        ),
        dates: DateTimeRange(
          start: DateTime(2020, 12, 1),
          end: DateTime(2020, 12, 24),
        ),
        uploader: UserStub(
          id: '<uid2>',
          name: '<name>',
          image: '<image_url1>',
        ),
        status: BookingStatus.PENDING,
      );

      test(
        'UserStub to Firestore object',
        () {
          expect(booking.toFirestoreObject(), {
            fs.Booking.ad: {
              fs.AdStub.title: '<title>',
              fs.AdStub.id: '<aid1>',
              fs.AdStub.uploader: {
                fs.UserStub.id: '<uid1>',
                fs.UserStub.name: '<name>',
                fs.UserStub.image: '<image_url2>',
              },
              fs.AdStub.type: 'FIND',
            },
            fs.Booking.dates: {
              fs.DateRange.startDate: DateTime(2020, 12, 1),
              fs.DateRange.endDate: DateTime(2020, 12, 24),
            },
            fs.Booking.status: 'PENDING',
            fs.Booking.booker: {
              fs.UserStub.id: '<uid2>',
              fs.UserStub.name: '<name>',
              fs.UserStub.image: '<image_url1>',
            },
          });
        },
      );
    },
  );
}
