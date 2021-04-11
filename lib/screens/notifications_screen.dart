import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../lang/my_localizations.dart';
import '../widgets/notifications/no_notifications.dart';
import '../widgets/notifications/notification_tile.dart';
import '../models/notification.dart' as models;
import '../utils/firestore_values.dart' as fs;

class NotificationsScreen extends StatelessWidget {
  final user = auth.FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.notificationsScreenTitle)),
      body: PaginateFirestore(
        itemBuilderType: PaginateBuilderType.listView,
        itemBuilder: (index, ctx, documentSnapshot) => NotificationTile(
            models.Notification.fromFirestoreObject(documentSnapshot)),
        query: FirebaseFirestore.instance
            .collection(fs.Collection.notifications)
            .where(fs.Notification.userId, isEqualTo: user!.uid),
        itemsPerPage: 10,
        emptyDisplay: NoNotifications(),
        isLive: true,
      ),
    );
  }
}
