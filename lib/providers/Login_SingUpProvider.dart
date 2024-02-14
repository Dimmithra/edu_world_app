import 'dart:async';

import 'package:edu_world_app/firebase/firebase_auth_services.dart';
import 'package:edu_world_app/pages/home_page/home_page.dart';
import 'package:edu_world_app/pages/login/login.dart';
import 'package:edu_world_app/pages/signup/sign_up_dashboard.dart';
import 'package:edu_world_app/utils/edu_world_message.dart';
import 'package:edu_world_app/utils/sheard_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer' as dev;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginAndSingUpProvider extends ChangeNotifier {
  FirebaseAuthServices auth = FirebaseAuthServices();
  final storage = new FlutterSecureStorage();
  TextEditingController usernameController = TextEditingController();
  TextEditingController get getusernameController => usernameController;

  TextEditingController emailConteroller = TextEditingController();
  TextEditingController get getemailConteroller => emailConteroller;

  TextEditingController passwordConteroller = TextEditingController();
  TextEditingController get getpasswordConteroller => passwordConteroller;

  TextEditingController conformPasswordConteroller = TextEditingController();
  TextEditingController get getconformPasswordConteroller =>
      conformPasswordConteroller;

  TextEditingController loginEmailConteroller = TextEditingController();
  TextEditingController get getloginEmailConteroller => loginEmailConteroller;

  TextEditingController loginPasswordConteroller = TextEditingController();
  TextEditingController get getloginPasswordConteroller =>
      loginPasswordConteroller;

  Future<void> loadAppData(context) async {
    var fistLogin = await storage.read(key: kFirstTimeLog);
    dev.log("$fistLogin");

    try {
      if (fistLogin == "true") {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen(),
            ),
          ),
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const SignUpDashBoard(),
            ),
          ),
        );
      }
    } catch (e) {
      dev.log("$e");
    }
  }

  bool loadingSignProcess = false;
  bool get getloadingSignProcess => loadingSignProcess;
  setloadingSignProcess(val) {
    loadingSignProcess = val;
    notifyListeners();
  }

  Future<void> validateSignUpData(context) async {
    RegExp passregex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    try {
      setloadingSignProcess(true);
      if (getpasswordConteroller.text != getconformPasswordConteroller.text) {
        eduWorldMessage(context,
                errorTxt: "Enter Password and Conform Password Mismacth")
            .show();
      } else {
        if (passregex.hasMatch(getpasswordConteroller.text)) {
          await singUpProcess(context);
        } else {
          eduWorldMessage(context,
                  errorTxt: "password length is short", btnType: 2)
              .show();
        }
      }
    } catch (e) {
      dev.log("$e");
    } finally {
      setloadingSignProcess(false);
    }
  }

  Future<void> singUpProcess(context) async {
    String username = usernameController.text;
    String email = emailConteroller.text;
    String password = passwordConteroller.text;
    try {
      setloadingSignProcess(true);
      User? user = await auth.signUpWithEmailAndPassword(email, password);
      if (user != null) {
        eduWorldMessage(context,
            errorTxt: "User Registartion Success",
            btnType: 3,
            buttons: [
              DialogButton(
                child: Text("Okay"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ]).show();
      } else {
        eduWorldMessage(context,
            errorTxt:
                "The email address is already in use by another account please Try again",
            btnType: 3,
            buttons: [
              DialogButton(
                child: Text("Okay"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]).show();
      }
    } catch (e) {
      dev.log("$e");
    } finally {
      setloadingSignProcess(false);
    }
  }

  bool loadingLoginProcess = false;
  bool get getloadingLoginProcess => loadingLoginProcess;
  setloadingLoginProcess(val) {
    loadingLoginProcess = val;
    notifyListeners();
  }

  Future<void> loginProcess(context) async {
    String email = loginEmailConteroller.text;
    String password = loginPasswordConteroller.text;
    dev.log("Login Email $email");

    try {
      setloadingLoginProcess(true);
      User? user = await auth.loginWithEmailAndPassword(email, password);
      if (user != null) {
        storage.write(key: kEmail, value: loginEmailConteroller.text);
        storage.write(key: kPassword, value: loginPasswordConteroller.text);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ),
              (route) => false,
        );
      } else {
        eduWorldMessage(context,
            errorTxt: "Login failed please Try again",
            btnType: 3,
            buttons: [
              DialogButton(
                child: Text("Okay"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]).show();
      }
    } catch (e) {
      dev.log("$e");
    } finally {
      setloadingLoginProcess(false);
    }
  }
}
