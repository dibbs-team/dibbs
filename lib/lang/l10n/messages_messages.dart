// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  static m0(price) => "${price} SEK/day";

  static m1(user) => "${user} accepted your dibb.";

  static m2(name) => "Continue to ${name}";

  static m3(uploader) => "Posted by ${uploader}";

  static m4(name) => "Welcome ${name}!";

  static m5(nrPhotos) => "Photos ${nrPhotos}/6. Add your main picture first. Add more photos to show different angles or marks";

  static m6(uploader) => "Rented out by ${uploader}";

  static m7(user) => "${user} wants to rent your item!";

  static m8(service) => "Sign in with ${service}";

  static m9(current, total) => "Step ${current}/${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "adInputContactNr" : MessageLookupByLibrary.simpleMessage("Add contact number"),
    "adInputPhoneHint" : MessageLookupByLibrary.simpleMessage("070 123 45 67"),
    "adInputPhoneInfo" : MessageLookupByLibrary.simpleMessage("Your phone number will only be visible upon accepted booking"),
    "adInputPhoneTitle" : MessageLookupByLibrary.simpleMessage("Phone Number"),
    "adPrice" : m0,
    "addCommunityInputHint" : MessageLookupByLibrary.simpleMessage("Code"),
    "addCommunityInstruction" : MessageLookupByLibrary.simpleMessage("Add community code"),
    "authFailed" : MessageLookupByLibrary.simpleMessage("Authentication failed. Please try again."),
    "bookingsScreenTitle" : MessageLookupByLibrary.simpleMessage("Bookings"),
    "camera" : MessageLookupByLibrary.simpleMessage("Camera"),
    "cancellationTerms" : MessageLookupByLibrary.simpleMessage("Cancellation terms"),
    "cancellationTermsBody" : MessageLookupByLibrary.simpleMessage("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
    "chooseUploadTypeHint" : MessageLookupByLibrary.simpleMessage("I want to..."),
    "chooseUploadTypeTitle" : MessageLookupByLibrary.simpleMessage("Upload ad"),
    "closeInformation" : MessageLookupByLibrary.simpleMessage("Let\'s start!"),
    "confirmation" : MessageLookupByLibrary.simpleMessage("Confirmation"),
    "confirmationMessage" : m1,
    "continueToCommunity" : m2,
    "datePickerHelp" : MessageLookupByLibrary.simpleMessage("Select the dates you are interested in"),
    "description" : MessageLookupByLibrary.simpleMessage("Description"),
    "dibbFindAd" : MessageLookupByLibrary.simpleMessage("I have this item"),
    "dibbListAd" : MessageLookupByLibrary.simpleMessage("Dibb this item"),
    "errorOccured" : MessageLookupByLibrary.simpleMessage("An error occured."),
    "feedScreenTitle" : MessageLookupByLibrary.simpleMessage("Explore"),
    "findAdDateTitle" : MessageLookupByLibrary.simpleMessage("Dates"),
    "findAdDescriptionHint" : MessageLookupByLibrary.simpleMessage("Describe what you are looking for"),
    "findAdDescriptionTitle" : MessageLookupByLibrary.simpleMessage("Description"),
    "findAdPriceHint" : MessageLookupByLibrary.simpleMessage("0 SEK"),
    "findAdPriceTitle" : MessageLookupByLibrary.simpleMessage("Maximum price"),
    "findAdTermsTitle" : MessageLookupByLibrary.simpleMessage("Accept terms and conditions"),
    "findAdTitle" : MessageLookupByLibrary.simpleMessage("Describe the item you are looking for"),
    "findAdUploaderName" : m3,
    "firebaseError" : MessageLookupByLibrary.simpleMessage("Something went wrong. Please check your internet connection"),
    "formTitle" : MessageLookupByLibrary.simpleMessage("Title"),
    "gallery" : MessageLookupByLibrary.simpleMessage("Gallery"),
    "informationWelcome" : m4,
    "listAdDescriptionHint" : MessageLookupByLibrary.simpleMessage("Describe your item"),
    "listAdDescriptionTitle" : MessageLookupByLibrary.simpleMessage("Description"),
    "listAdImagesInfo" : m5,
    "listAdImagesTitle" : MessageLookupByLibrary.simpleMessage("Upload pictures"),
    "listAdPaymentTitle" : MessageLookupByLibrary.simpleMessage("Set up payment"),
    "listAdPriceHint" : MessageLookupByLibrary.simpleMessage("0 SEK"),
    "listAdPriceTitle" : MessageLookupByLibrary.simpleMessage("Price per day"),
    "listAdTitle" : MessageLookupByLibrary.simpleMessage("Describe your item"),
    "listAdUploaderName" : m6,
    "longTemp" : MessageLookupByLibrary.simpleMessage("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    "nextStep" : MessageLookupByLibrary.simpleMessage("Next"),
    "noAds" : MessageLookupByLibrary.simpleMessage("Sorry, we could not find any ads"),
    "noCommunityFound" : MessageLookupByLibrary.simpleMessage("Sorry, we can not find that community. Make sure you have the right code."),
    "noNotifications" : MessageLookupByLibrary.simpleMessage("You\'re all caught up"),
    "notificationsScreenTitle" : MessageLookupByLibrary.simpleMessage("Notifications"),
    "paymentSettings" : MessageLookupByLibrary.simpleMessage("Payment settings"),
    "profileScreenTitle" : MessageLookupByLibrary.simpleMessage("Profile"),
    "rentingRules" : MessageLookupByLibrary.simpleMessage("Renting rules"),
    "rentingRulesBody" : MessageLookupByLibrary.simpleMessage("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
    "request" : MessageLookupByLibrary.simpleMessage("Request"),
    "requestMessage" : m7,
    "requiredField" : MessageLookupByLibrary.simpleMessage("This field is required."),
    "signInButtonText" : m8,
    "signOut" : MessageLookupByLibrary.simpleMessage("Sign out"),
    "successfulUpload" : MessageLookupByLibrary.simpleMessage("Ad upload was successful."),
    "title" : MessageLookupByLibrary.simpleMessage("Dibbs"),
    "unsuccessfulUpload" : MessageLookupByLibrary.simpleMessage("Ad upload was unsuccessful."),
    "uploadAd" : MessageLookupByLibrary.simpleMessage("Publish"),
    "uploadScreenTitle" : MessageLookupByLibrary.simpleMessage("Upload ad"),
    "uploadStep" : m9,
    "uploadTypeFind" : MessageLookupByLibrary.simpleMessage("Find"),
    "uploadTypeList" : MessageLookupByLibrary.simpleMessage("Rent out"),
    "userListings" : MessageLookupByLibrary.simpleMessage("Your listings")
  };
}
