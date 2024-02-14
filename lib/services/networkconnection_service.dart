import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

import 'package:rflutter_alert/rflutter_alert.dart';

class InternetConnectionChecker {
  static final InternetConnectionChecker _instance =
  InternetConnectionChecker._internal();

  factory InternetConnectionChecker() {
    return _instance;
  }

  InternetConnectionChecker._internal();

  Future<bool> isInternetAvailable(context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {

      dev.log('network fasle');
      return false;
      // No internet connection
    } else {
      dev.log('network true');
      return true;
      // Internet connection available
    }
  }
}
