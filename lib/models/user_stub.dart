import 'package:equatable/equatable.dart';

import '../utils/firestore_values.dart' as fs;

/// Smaller representation of a user.
class UserStub extends Equatable {
  /// The users id
  final String id;

  /// The users name
  final String name;

  /// The profile image of the user
  final String image;

  @override
  List<Object> get props => [
        id,
        name,
        image,
      ];

  UserStub({
    required this.id,
    required this.name,
    required this.image,
  });

  /// Creates an instance from a Firestore object.
  UserStub.fromFirestoreObject(Map<String, dynamic> obj)
      : this.id = obj[fs.UserStub.id],
        this.name = obj[fs.UserStub.name],
        this.image = obj[fs.UserStub.image];

  /// Returns a map representation suitable for Firestore.
  Map<String, dynamic> toFirestoreObject() {
    return {
      fs.UserStub.id: id,
      fs.UserStub.name: name,
      fs.UserStub.image: image,
    };
  }
}
