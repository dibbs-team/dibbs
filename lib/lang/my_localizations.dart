import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'l10n/messages_all.dart';

class MyLocalizations {
  /// Initialize localization systems and messages
  static Future<MyLocalizations> load(Locale locale) async {
    // If we're given "en_US", we'll use it as-is. If we're
    // given "en", we extract it and use it.
    final String localeName =
        locale.countryCode == null || locale.countryCode!.isEmpty
            ? locale.languageCode
            : locale.toString();
    // We make sure the locale name is in the right format e.g.
    // converting "en-US" to "en_US".
    final String canonicalLocaleName = Intl.canonicalizedLocale(localeName);
    // Load localized messages for the current locale.
    await initializeMessages(canonicalLocaleName);
    // Force the locale in Intl.
    Intl.defaultLocale = canonicalLocaleName;
    return MyLocalizations();
  }

  /// Retrieve localization resources for the widget tree
  /// corresponding to the given `context`
  static MyLocalizations of(BuildContext context) =>
      Localizations.of<MyLocalizations>(context, MyLocalizations)!;

  // ----------------------
  // Declare messages here.
  // ----------------------

  String get title => Intl.message(
        'Dibbs',
        name: 'title',
        desc: 'App title',
      );

  String get feedScreenTitle => Intl.message(
        'Explore',
        name: 'feedScreenTitle',
        desc: 'Name of feed screen.',
      );
  String get bookingsScreenTitle => Intl.message(
        'Bookings',
        name: 'bookingsScreenTitle',
        desc: 'Name of bookings screen.',
      );
  String get notificationsScreenTitle => Intl.message(
        'Notifications',
        name: 'notificationsScreenTitle',
        desc: 'Name of notifications screen.',
      );

  String get uploadScreenTitle => Intl.message(
        'Upload ad',
        name: 'uploadScreenTitle',
        desc: 'Name of upload screen.',
      );

  String get profileScreenTitle => Intl.message(
        'Profile',
        name: 'profileScreenTitle',
        desc: 'Name of profile screen.',
      );

  String get rentingRules => Intl.message(
        'Renting rules',
        name: 'rentingRules',
        desc: 'Renting rules title.',
      );

  String get cancellationTerms => Intl.message(
        'Cancellation terms',
        name: 'cancellationTerms',
        desc: 'Cancellation terms title.',
      );

  String get rentingRulesBody => Intl.message(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
        'eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        name: 'rentingRulesBody',
        desc: 'Renting rules text.',
      );

  String get cancellationTermsBody => Intl.message(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
        'eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        name: 'cancellationTermsBody',
        desc: 'Cancellation terms text.',
      );

  String get description => Intl.message(
        'Description',
        name: 'description',
        desc: 'Description title',
      );

  String get formTitle => Intl.message(
        'Title',
        name: 'formTitle',
        desc: 'Title when used in forms.',
      );

  String signInButtonText(String service) => Intl.message(
        'Sign in with $service',
        name: 'signInButtonText',
        args: [service],
        desc: 'Text on sign in button',
        examples: const {'service': 'Google'},
      );

  String get authFailed =>
      Intl.message('Authentication failed. Please try again.',
          name: 'authFailed',
          desc: 'Shown in snackbar if authentication is unsuccessful.');

  String get requiredField => Intl.message(
        'This field is required.',
        name: 'requiredField',
        desc: 'Shown in input form when required field is empty.',
      );

  String get successfulUpload => Intl.message(
        'Ad upload was successful.',
        name: 'successfulUpload',
        desc: 'Shown in snackbar after upload was successful.',
      );

  String get unsuccessfulUpload => Intl.message(
        'Ad upload was unsuccessful.',
        name: 'unsuccessfulUpload',
        desc: 'Shown in snackbar after upload was unsuccessful.',
      );

  String get nextStep => Intl.message(
        'Next',
        name: 'nextStep',
        desc: 'Text on button to go to next step when uploading an ad.',
      );

  String get uploadAd => Intl.message(
        'Publish',
        name: 'uploadAd',
        desc: 'Text on button to upload a ad.',
      );

  String get errorOccured => Intl.message(
        'An error occured.',
        name: 'errorOccured',
        desc: 'General error occured text. Shown in for example a snackbar.',
      );

  String uploadStep(
    int current,
    int total,
  ) =>
      Intl.message(
        'Step $current/$total',
        name: 'uploadStep',
        args: [current, total],
        desc: 'AppBar text on when uploading ad.',
        examples: const {'current': 2, 'total': 4},
      );

  String get signOut => Intl.message(
        'Sign out',
        name: 'signOut',
        desc: 'Sign out, showed on button for signing out.',
      );

  String get closeInformation => Intl.message(
        "Let's start!",
        name: 'closeInformation',
        desc: 'Text on button on information screen.',
      );

  String informationWelcome(String name) => Intl.message(
        'Welcome $name!',
        name: 'informationWelcome',
        args: [name],
        desc: 'Welcome text on information screen.',
        examples: const {'name': 'Jane'},
      );

  String get chooseUploadTypeTitle => Intl.message(
        'Upload ad',
        name: 'chooseUploadTypeTitle',
        desc: 'AppBar title when choosing upload type.',
      );

  String get chooseUploadTypeHint => Intl.message(
        'I want to...',
        name: 'chooseUploadTypeHint',
        desc: 'Hint when choosing upload type.',
      );

  String get uploadTypeFind => Intl.message(
        'Find',
        name: 'uploadTypeFind',
        desc: 'Name of find when choosing type',
      );

  String get uploadTypeList => Intl.message(
        'Rent out',
        name: 'uploadTypeList',
        desc: 'Name of list ad when choosing type',
      );

  String get addCommunityInstruction => Intl.message(
        'Add community code',
        name: 'addCommunityInstruction',
        desc: 'Instructions for adding a community code.',
      );

  String get addCommunityInputHint => Intl.message(
        'Code',
        name: 'addCommunityInputHint',
        desc: 'Hint for input field for adding a community code.',
      );

  String continueToCommunity(String name) => Intl.message(
        'Continue to $name',
        name: 'continueToCommunity',
        args: [name],
        desc: 'Text on button for finishing adding a community.',
        examples: const {'name': 'Dibbs Team'},
      );

  String get noCommunityFound => Intl.message(
        'Sorry, we can not find that community. Make sure you have the right code.',
        name: 'noCommunityFound',
        desc: 'Text on add community screen when no community was found.',
      );

  String get firebaseError => Intl.message(
        'Something went wrong. Please check your internet connection',
        name: 'firebaseError',
        desc: 'Showed in a snackbar when a call to firebase gives an error.',
      );

  String get findAdTitle => Intl.message(
        'Describe the item you are looking for',
        name: 'findAdTitle',
        desc: 'Title screen for form input when uploading a find ad.',
      );

  String get findAdDescriptionTitle => Intl.message(
        'Description',
        name: 'findAdDescriptionTitle',
        desc: 'Title on description input when uploading a find ad.',
      );

  String get findAdDescriptionHint => Intl.message(
        'Describe what you are looking for',
        name: 'findAdDescriptionHint',
        desc: 'Hint on description input when uploading a find ad.',
      );

  String get findAdPriceHint => Intl.message(
        '0 SEK',
        name: 'findAdPriceHint',
        desc: 'Hint on price input when uploading a find ad.',
      );

  String get findAdPriceTitle => Intl.message(
        'Maximum price',
        name: 'findAdPriceTitle',
        desc: 'Title on price input when uploading a find ad.',
      );

  String get findAdDateTitle => Intl.message(
        'Dates',
        name: 'findAdDateTitle',
        desc: 'Title on dates input when uploading a find ad.',
      );

  String get findAdTermsTitle => Intl.message(
        'Accept terms and conditions',
        name: 'findAdTermsTitle',
        desc: 'Title for accepting terms when uploading a find ad.',
      );

  String get adInputContactNr => Intl.message(
        'Add contact number',
        name: 'adInputContactNr',
        desc: 'Title above phone number input',
      );

  String get adInputPhoneTitle => Intl.message(
        'Phone Number',
        name: 'adInputPhoneTitle',
        desc: 'Title on phone input when uploading an ad.',
      );

  String get adInputPhoneHint => Intl.message(
        '070 123 45 67',
        name: 'adInputPhoneHint',
        desc: 'Hint on phone input when uploading an ad.',
      );

  String get adInputPhoneInfo => Intl.message(
        'Your phone number will only be visible upon accepted booking',
        name: 'adInputPhoneInfo',
        desc: 'More information about phone input when uploading an ad.',
      );

  String get longTemp => Intl.message(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
        'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad'
        ' minim veniam, quis nostrud exercitation ullamco laboris nisi ut '
        'aliquip ex ea commodo consequat. Duis aute irure dolor in '
        'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla'
        ' pariatur. Excepteur sint occaecat cupidatat non proident, sunt in '
        'culpa qui officia deserunt mollit anim id est laborum.',
        name: 'longTemp',
        desc: 'Longer temporary text.',
      );

  String get datePickerHelp => Intl.message(
        'Select the dates you are interested in',
        name: 'datePickerHelp',
        desc: 'Instrucitons date picker.',
      );

  String get listAdImagesTitle => Intl.message(
        'Upload pictures',
        name: 'listAdImagesTitle',
        desc: 'Title for uploading images when creating a list ad.',
      );

  String listAdImagesInfo(int nrPhotos) => Intl.message(
        'Photos $nrPhotos/6. Add your main picture first. Add more photos to show different angles or marks',
        name: 'listAdImagesInfo',
        desc:
            'Additional info to show when uploading images when creating a list ad.',
        args: [nrPhotos],
        examples: const {'nrPhotos': 4},
      );

  String get listAdDescriptionHint => Intl.message(
        'Describe your item',
        name: 'listAdDescriptionHint',
        desc: 'Hint on description input when uploading a list ad.',
      );

  String get listAdTitle => Intl.message(
        'Describe your item',
        name: 'listAdTitle',
        desc: 'Title of form when uploading a list ad',
      );

  String get listAdDescriptionTitle => Intl.message(
        'Description',
        name: 'listAdDescriptionTitle',
        desc: 'Title on description input when uploading a list ad.',
      );

  String get listAdPriceTitle => Intl.message(
        'Price per day',
        name: 'listAdPriceTitle',
        desc: 'Title on price input when uploading a list ad.',
      );

  String get listAdPriceHint => Intl.message(
        '0 SEK',
        name: 'listAdPriceHint',
        desc: 'Hint on price input when uploading a list ad.',
      );

  String get listAdPaymentTitle => Intl.message(
        'Set up payment',
        name: 'listAdPaymentTitle',
        desc: 'Title on payment input when uploading a list ad.',
      );

  String get camera => Intl.message(
        'Camera',
        name: 'camera',
        desc: 'Button text for uploading an image using the camera.',
      );

  String get gallery => Intl.message(
        'Gallery',
        name: 'gallery',
        desc: 'Button text for uploading an image from the gallery.',
      );

  String get noAds => Intl.message(
        'Sorry, we could not find any ads',
        name: 'noAds',
        desc: 'Text shown when there are no ads in the feed screen.',
      );

  String get dibbListAd => Intl.message(
        'Dibb this item',
        name: 'dibbListAd',
        desc: 'Text shown on button for renting an item.',
      );

  String get dibbFindAd => Intl.message(
        'I have this item',
        name: 'dibbFindAd',
        desc: 'Text shown on button for responding to a find ad.',
      );

  String adPrice(int price) => Intl.message(
        '$price SEK/day',
        name: 'adPrice',
        args: [price],
        desc: 'Price in ad detail.',
        examples: const {'price': 99},
      );

  String get userListings => Intl.message(
        'Your listings',
        name: 'userListings',
        desc: 'Text shown on profile screen over the users listed ads.',
      );

  String get paymentSettings => Intl.message(
        'Payment settings',
        name: 'paymentSettings',
        desc: 'Open payment settings, shown on button',
      );

  String listAdUploaderName(String uploader) => Intl.message(
        'Rented out by $uploader',
        name: 'listAdUploaderName',
        args: [uploader],
        desc: 'Text for preseting name of uploader of list ad.',
        examples: const {'uploader': 'Peter Pan'},
      );

  String findAdUploaderName(String uploader) => Intl.message(
        'Posted by $uploader',
        name: 'findAdUploaderName',
        args: [uploader],
        desc: 'Text for preseting name of uploader of find ad.',
        examples: const {'uploader': 'Peter Pan'},
      );

  String get noNotifications => Intl.message(
        'You\'re all caught up',
        name: 'noNotifications',
        desc: 'Shown on notifications screen when there are no notifications.',
      );

  String get confirmation => Intl.message(
        'Confirmation',
        name: 'confirmation',
        desc: 'Title for confirmation notifications.',
      );

  String get request => Intl.message(
        'Request',
        name: 'request',
        desc: 'Title for request notifications.',
      );

  String confirmationMessage(String user) => Intl.message(
        '$user accepted your dibb.',
        name: 'confirmationMessage',
        args: [user],
        desc: 'Notification message for confirmation.',
        examples: const {'user': 'Peter Pan'},
      );

  String requestMessage(String user) => Intl.message(
        '$user wants to rent your item!',
        name: 'requestMessage',
        args: [user],
        desc: 'Notification message for request.',
        examples: const {'user': 'Peter Pan'},
      );

  String get listBookingDateTitle => Intl.message(
        'Select date',
        name: 'listBookingDateTitle',
        desc: 'Title when selecting date for a booking of a listAd',
      );

  String get listBookingDateInfo => Intl.message(
        'Add dates to see exact price',
        name: 'listBookingDateInfo',
        desc: 'info under title when selecting dates for a booking of a listAd',
      );

  String get listBookingDatesFieldTitle => Intl.message(
        'Pick-up - Drop-of',
        name: 'listBookingDatesFieldTitle',
        desc:
            'Title over form field when selecting dates for a booking of a listAd',
      );

  String get priceTitle => Intl.message(
        'Price',
        name: 'priceTitle',
        desc: 'Used as title for booking',
      );

  String get nrOfDays => Intl.message(
        'Number of days',
        name: 'nrOfDays',
        desc: 'Used when making a booking',
      );

  String get total => Intl.message(
        'Total',
        name: 'total',
        desc: 'Used when making a booking',
      );

  String price(int price) => Intl.message(
        '$price SEK',
        name: 'price',
        args: [price],
        desc: 'Add the type of currency to a number',
      );

  String get confirmRequest => Intl.message(
        'Confirm request',
        name: 'confirmRequest',
        desc: 'Used when making a booking',
      );

  String get finish => Intl.message(
        'Finish',
        name: 'finish',
        desc: 'Displayed on button when booking an Ad',
      );

  String get bookingCompletedTitle => Intl.message(
        'All done!',
        name: 'bookingCompletedTitle',
        desc: 'Displayed when booking an ad is completed.',
      );

  String requestSentConfirmation(String user) => Intl.message(
        'Your request has been sent to $user',
        name: 'requestSentConfirmation',
        args: [user],
        desc: 'Confirmation that a request has been sent when booking an ad.',
        examples: const {'user': 'Peter Pan'},
      );

  String get requestSentInfo => Intl.message(
        'We will notify you when the request has been processed, and is ready '
        'for pick-up. Meanwhile give yourself a pat on the back for '
        'contributing to a more sustainable society!',
        name: 'requestSentInfo',
        desc: 'Information displayed when booking an ad is completed.',
      );
}
