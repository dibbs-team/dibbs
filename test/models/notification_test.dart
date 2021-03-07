import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

import 'package:dibbs/models/notification.dart' as models;
import 'package:dibbs/utils/firestore_values.dart' as fs;
import 'package:dibbs/utils/notification_types.dart';

void main() {
  group(
    'Notification convertion',
    () {
      final notification = models.Notification(
        userId: '<user_id>',
        time: DateTime(2020, 12, 1),
        type: NotificationType.REQUEST,
        image: '<image_url>',
        fromUser: '<name>',
      );

      test(
        'Notification to Firestore object',
        () {
          expect(notification.toFirestoreObject(), {
            fs.Notification.fromUser: '<name>',
            fs.Notification.image: '<image_url>',
            fs.Notification.time: Timestamp.fromDate(DateTime(2020, 12, 1)),
            fs.Notification.type: 'REQUEST',
            fs.Notification.userId: '<user_id>'
          });
        },
      );

      // test(
      //   'Firestore object to Notification',
      //   () async {
      //     // Add notification to Firestore.
      //     final instance = MockFirestoreInstance();
      //     await instance
      //         .collection(fs.Collection.notifications)
      //         .doc('notification_id')
      //         .set(notification.toFirestoreObject());

      //     // Get ad from Firestore.
      //     final snapshot = await instance
      //         .collection(fs.Collection.notifications)
      //         .doc('notification_id')
      //         .get();
      //     expect(
      //         models.Notification.fromFirestoreObject(snapshot), notification);
      //   },
      // );
    },
  );
}
