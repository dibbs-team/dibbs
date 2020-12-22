import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import '../models/ad.dart';
import '../lang/my_localizations.dart';
import '../design/my_attributes.dart';
import '../widgets/profile/profile_drawer.dart';
import '../widgets/explore/ad_item.dart';
import '../utils/firestore_values.dart';

class ProfileScreen extends StatelessWidget {
  final user = auth.FirebaseAuth.instance.currentUser;

  void signOut() {
    auth.FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);
    const spacing = 24.0;

    return Scaffold(
      endDrawer: ProfileDrawer(callback: signOut),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.profileScreenTitle),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(user.photoURL),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.displayName,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(l10n.userListings),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: const Divider(height: 0),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing),
              child: PaginateFirestore(
                itemBuilderType: PaginateBuilderType.gridView,
                itemBuilder: (index, ctx, documentSnapshot) =>
                    AdItem(Ad.fromFirestoreObject(documentSnapshot)),
                query:
                    FirebaseFirestore.instance.collection(Collection.ads).where(
                          '${Ads.uploader}.${AdUploader.id}',
                          isEqualTo: user.uid,
                        ),
                itemsPerPage: 10,
                emptyDisplay: Container(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MyAttributes.imageAspectRatio * 0.85,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
