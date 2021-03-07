import 'package:flutter_test/flutter_test.dart';
// import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

import '../../lib/utils/firestore_values.dart' as fs;
import '../../lib/models/user_stub.dart';

void main() {
  group(
    'UserStub convertion',
    () {
      final userStub = UserStub(
        id: '<uid>',
        name: '<name>',
        image: '<image_url1>',
      );

      test(
        'UserStub to Firestore object',
        () {
          expect(userStub.toFirestoreObject(), {
            fs.UserStub.id: '<uid>',
            fs.UserStub.name: '<name>',
            fs.UserStub.image: '<image_url1>',
          });
        },
      );
    },
  );
}
