// import 'package:flutter/services.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void changeKeyboardLanguage(String languageCode) {
  SystemChannels.textInput.invokeMethod('TextInput.setLocale', languageCode);
  // SystemChannels.textInput.invokeMethod('TextInput.show', languageCode);
  
}