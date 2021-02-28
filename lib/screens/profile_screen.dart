import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import '../models/ad.dart';
import '../lang/my_localizations.dart';
import '../design/my_attributes.dart';
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

    void showUserSettingsSheet() {
      showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: MyAttributes.borderRadiusTop,
        ),
        builder: (BuildContext context) {
          // Wrap allow the Sheet to have the same height as its content.
          return Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // This button is currently always disabled since payment
                    // have not been implemented yet.
                    TextButton(
                      child: Text(l10n.paymentSettings),
                      onPressed: null,
                    ),
                    Divider(),
                    TextButton(
                      child: Text(l10n.signOut),
                      onPressed: () {
                        Navigator.pop(context);
                        this.signOut();
                      },
                    ),
                    Divider(),
                  ],
                ),
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.profileScreenTitle),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.settings),
              onPressed: showUserSettingsSheet,
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Picture, name
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
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
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 20.0),
            child: Text(
              l10n.userListings,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Divider(
              height: 0,
              indent: 10.0,
              endIndent: 10.0,
            ),
          ),

          // Listings
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: spacing),
              child: PaginateFirestore(
                isLive: true, //* Causes a refresh when a new ad is uploaded.
                header: SizedBox(height: 24.0),
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
