import 'package:flutter/material.dart';
import 'app_widget.dart';

void main() {
  try {
    runApp(AppWidget());
  } catch (error, stacktrace) {
    debugPrint("Exception occured: $error stackTrace: $stacktrace");

    throw Exception(error);
  }
}
