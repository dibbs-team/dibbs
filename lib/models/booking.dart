import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../utils/firestore_values.dart' as fs;
import 'user_stub.dart';
import 'ad_stub.dart';

///The Current status of the booking
enum BookingStatus {
  /// The other party has not responded to the booking request yet
  PENDING,

  /// The booking has been confirmed
  CONFIRMED,

  /// The booking has been rejected
  REJECTED,

  /// The booking period is currently in effect
  ACTIVE,

  /// The booking period has past
  RETURNED,

  /// The Booking request never recieved any response
  EXPIRED,

  /// The booking request was cancelled
  CANCELLED,
}

class Booking extends Equatable {
  /// The unique id of the booking
  final String? id;

  /// The ad the booking refers to
  final AdStub ad;

  /// The time the booking want to book the item
  final DateTimeRange dates;

  /// The User who want to book the item
  final UserStub uploader;

  /// The status of the booking
  final BookingStatus status;

  Booking({
    this.id,
    required this.ad,
    required this.dates,
    required this.uploader,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        ad,
        dates,
        uploader,
        status,
      ];

  /// Returns a map representation suitable for Firestore.
  Map<String, dynamic> toFirestoreObject() {
    return {
      fs.Booking.dates: {
        fs.DateRange.startDate: dates.start,
        fs.DateRange.endDate: dates.end,
      },
      fs.Booking.ad: ad.toFirestoreObject(),
      fs.Booking.status: EnumToString.convertToString(status),
      fs.Booking.booker: uploader.toFirestoreObject(),
    };
  }

  /// Creates an instance from a DocumentSnapshot from Firestore.
  factory Booking.fromFirestoreObject(DocumentSnapshot snapshot) {
    final data = snapshot.data()!;

    return Booking(
      id: snapshot.id,
      ad: AdStub.fromFirestoreObject(data[fs.Booking.ad]),
      dates: DateTimeRange(
        start: data[fs.Booking.dates][fs.DateRange.startDate].toDate(),
        end: data[fs.Booking.dates][fs.DateRange.endDate].toDate(),
      ),
      status: EnumToString.fromString(
          BookingStatus.values, data[fs.Booking.status])!,
      uploader: UserStub.fromFirestoreObject(data[fs.Booking.booker]),
    );
  }
}
