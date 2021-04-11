import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';

import '../utils/firestore_values.dart' as fs;
import 'user_stub.dart';
import '../utils/ad_types.dart';

/// A smaller representation of an ad
abstract class AdStub extends Equatable {
  /// The id of the full ad
  final String id;

  /// The uploader of the ad
  final UserStub uploader;

  /// The title of the ad
  final String title;

  /// The type of the ad
  final AdType adType;

  AdStub({
    required this.id,
    required this.uploader,
    required this.title,
    required this.adType,
  });

  /// Returns a map representation suitable for Firestore.
  Map<String, dynamic> toFirestoreObject();

  @override
  List<Object> get props => [
        id,
        title,
        uploader,
        adType,
      ];

  factory AdStub.fromFirestoreObject(Map<String, dynamic> data) {
    final type = EnumToString.fromString(AdType.values, data[fs.AdStub.type]);

    switch (type) {
      case AdType.FIND:
        return FindAdStub(
          id: data[fs.AdStub.id],
          title: data[fs.AdStub.title],
          uploader: UserStub.fromFirestoreObject(data[fs.AdStub.uploader]),
        );

      case AdType.LIST:
        return ListAdStub(
            id: data[fs.AdStub.id],
            title: data[fs.AdStub.title],
            uploader: UserStub.fromFirestoreObject(data[fs.AdStub.uploader]),
            image: data[fs.AdStub.image]);

      default:
        throw TypeError();
    }
  }
}

class ListAdStub extends AdStub {
  final String image;

  @override
  List<Object> get props => super.props + [image];

  ListAdStub({
    required id,
    required uploader,
    required title,
    required this.image,
  }) : super(
          id: id,
          uploader: uploader,
          title: title,
          adType: AdType.LIST,
        );

  Map<String, dynamic> toFirestoreObject() {
    return {
      fs.AdStub.id: id,
      fs.AdStub.uploader: uploader.toFirestoreObject(),
      fs.AdStub.title: title,
      fs.AdStub.type: EnumToString.convertToString(adType),
      fs.AdStub.image: image,
    };
  }
}

class FindAdStub extends AdStub {
  FindAdStub({
    required id,
    required uploader,
    required title,
  }) : super(
          id: id,
          uploader: uploader,
          title: title,
          adType: AdType.FIND,
        );

  Map<String, dynamic> toFirestoreObject() {
    return {
      fs.AdStub.id: id,
      fs.AdStub.uploader: uploader.toFirestoreObject(),
      fs.AdStub.title: title,
      fs.AdStub.type: EnumToString.convertToString(adType),
    };
  }
}
