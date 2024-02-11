import 'dart:async';

import 'package:edu_world_app/pages/signup/sign_up_dashboard.dart';
import 'package:edu_world_app/providers/Login_SingUpProvider.dart';
import 'package:edu_world_app/services/context_helper.dart';
import 'package:edu_world_app/utils/sheard_data.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  final storage = new FlutterSecureStorage();
  // var loginAndSingUpProvider = Provider.of<LoginAndSingUpProvider>(
  //   listen: false,
  // ContextHelper.navigatorKey.currentContext!,
  // listen: false
  // );
}
