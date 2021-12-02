import 'dart:io';
import 'package:intl/intl.dart';

class Helpers{
  static String get getCurrency {
    var format =
    NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    return format.currencySymbol;
  }
}

