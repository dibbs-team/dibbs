import 'package:flutter_test/flutter_test.dart';
// import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

import '../../lib/models/ad_stub.dart';
import '../../lib/models/user_stub.dart';
import '../../lib/utils/firestore_values.dart' as fs;

void main() {
  group(
    'FindAdStub convertion',
    () {
      final findAdStub = FindAdStub(
        id: '<aid>',
        uploader: UserStub(
          id: '<uid>',
          name: '<name>',
          image: '<image_url3>',
        ),
        title: '<title>',
      );

      test(
        'FindAdStub to Firestore object',
        () {
          expect(findAdStub.toFirestoreObject(), {
            fs.AdStub.title: '<title>',
            fs.AdStub.id: '<aid>',
            fs.Ad.uploader: {
              fs.UserStub.id: '<uid>',
              fs.UserStub.name: '<name>',
              fs.UserStub.image: '<image_url3>',
            },
            fs.AdStub.type: 'FIND',
          });
        },
      );
    },
  );

  group(
    'ListAdStub convertion',
    () {
      final listAdStub = ListAdStub(
        id: '<aid>',
        uploader: UserStub(
          id: '<uid>',
          name: '<name>',
          image: '<image_url3>',
        ),
        title: '<title>',
        image: '<image_url1>',
      );

      test(
        'ListAdStub to Firestore object',
        () {
          expect(listAdStub.toFirestoreObject(), {
            fs.AdStub.title: '<title>',
            fs.AdStub.id: '<aid>',
            fs.AdStub.uploader: {
              fs.UserStub.id: '<uid>',
              fs.UserStub.name: '<name>',
              fs.UserStub.image: '<image_url3>',
            },
            fs.AdStub.image: '<image_url1>',
            fs.AdStub.type: 'LIST',
          });
        },
      );
    },
  );
}
