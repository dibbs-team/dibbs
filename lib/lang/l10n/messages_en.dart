// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(step) => "${step}. Describe your item";

  static m1(step) => "${step}. Set up payment";

  static m2(step) => "${step}. Upload pictures";

  static m3(step) => "${step}. Set your rules";

  static m4(service) => "Sign in with ${service}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "authFailed" : MessageLookupByLibrary.simpleMessage("Authentication failed. Please try again."),
    "description" : MessageLookupByLibrary.simpleMessage("Description"),
    "descriptionStepTitle" : m0,
    "errorOccured" : MessageLookupByLibrary.simpleMessage("An error occured."),
    "feedScreenTitle" : MessageLookupByLibrary.simpleMessage("Explore"),
    "nextStep" : MessageLookupByLibrary.simpleMessage("Next"),
    "paymentStepTitle" : m1,
    "picturesStepTitle" : m2,
    "profileScreenTitle" : MessageLookupByLibrary.simpleMessage("Profile"),
    "requiredField" : MessageLookupByLibrary.simpleMessage("This field is required."),
    "rulesStepTitle" : m3,
    "signInButtonText" : m4,
    "signOut" : MessageLookupByLibrary.simpleMessage("Sign out"),
    "successfulUpload" : MessageLookupByLibrary.simpleMessage("Product upload was successful."),
    "title" : MessageLookupByLibrary.simpleMessage("Dibbs"),
    "unsuccessfulUpload" : MessageLookupByLibrary.simpleMessage("Product upload was unsuccessful."),
    "uploadProduct" : MessageLookupByLibrary.simpleMessage("Publish"),
    "uploadScreenTitle" : MessageLookupByLibrary.simpleMessage("Upload product")
  };
}
