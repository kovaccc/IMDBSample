// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the auth program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(voteAverage) => "${voteAverage}/10 IMDb";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "evaluation": m0,
        "favourites": MessageLookupByLibrary.simpleMessage("Favourites"),
        "invalid_api_key_error": MessageLookupByLibrary.simpleMessage(
            "Invalid API key: You must be granted a valid key."),
        "login": MessageLookupByLibrary.simpleMessage("login"),
        "logout": MessageLookupByLibrary.simpleMessage("logout"),
        "movies": MessageLookupByLibrary.simpleMessage("Movies"),
        "network_connection_not_available":
            MessageLookupByLibrary.simpleMessage(
                "Network connection not available"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "page_must_be_less_than": MessageLookupByLibrary.simpleMessage(
            "page must be less than or equal to 500"),
        "popular": MessageLookupByLibrary.simpleMessage("Popular"),
        "server_error": MessageLookupByLibrary.simpleMessage(
            "Something is wrong with the server, please contact system administrator!"),
        "unknown_error": MessageLookupByLibrary.simpleMessage("Unknown error"),
        "update_favourite_failure":
            MessageLookupByLibrary.simpleMessage("Update favourite failure")
      };
}
