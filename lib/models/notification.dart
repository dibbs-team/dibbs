import 'package:flutter/material.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/firestore_values.dart' as fs;
import '../utils/notification_types.dart';

class Notification extends Equatable {
  final String fromUser;
  final String image;
  final DateTime time;
  final NotificationType type;
  final String userId;

  Notification({
    @required this.userId,
    @required this.time,
    @required this.type,
    @required this.image,
    @required this.fromUser,
  });

  @override
  List<Object> get props => [
        fromUser,
        image,
        time,
        type,
        userId,
      ];

  /// Creates an instance from a Firestore object.
  factory Notification.fromFirestoreObject(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    return Notification(
      fromUser: data[fs.Notification.fromUser],
      image: data[fs.Notification.image],
      time: data[fs.Notification.time].toDate(),
      type: EnumToString.fromString(
          NotificationType.values, data[fs.Notification.type]),
      userId: data[fs.Notification.userId],
    );
  }

  /// Returns a map representation suitable for Firestore.
  Map<String, dynamic> toFirestoreObject() {
    return {
      fs.Notification.fromUser: fromUser,
      fs.Notification.image: image,
      fs.Notification.time: Timestamp.fromDate(time),
      fs.Notification.type: EnumToString.convertToString(type),
      fs.Notification.userId: userId,
    };
  }
}
