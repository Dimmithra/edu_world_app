import 'dart:convert';

import 'package:edu_world_app/model/getAll_book_model.dart';
import 'package:edu_world_app/model/getAll_book_model.dart';
import 'package:edu_world_app/services/common_http.dart';
import 'package:edu_world_app/utils/sheard_data.dart';
import 'package:edu_world_app/utils/url.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeProvider extends ChangeNotifier {
  final storage = new FlutterSecureStorage();

  //bottom nav bar
  int selectedIndex = 0;

  void onTapIcon(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  //DarkMode and Light Mode
  bool darkMode = false;
  bool get getDarkTheme => darkMode;

  Future<void> loadTheme() async {
    String? theme = await storage.read(key: kThemeStyle);
    dev.log(kThemeStyle);
    if (theme != null) {
      darkMode = theme == 'dark';
    }
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    darkMode = !darkMode;
    await storage.write(key: kThemeStyle, value: darkMode ? 'dark' : 'light');
    notifyListeners();
  }

  bool loadingHomepageData = false;
  bool get getloadingHomepageData => loadingHomepageData;
  setloadingHomepageData(val) {
    loadingHomepageData = val;
    notifyListeners();
  }

  Future<void> getAllBookData(context) async {
    try {
      setloadingHomepageData(true);
      final CommonHttp commonHttp = CommonHttp('', '');
      final Map<String, dynamic> responseMap =
          await commonHttp.get(getAllbook); // Assuming this returns a Map
      final List<dynamic>? responseDataList =
          responseMap['data']; // Assuming 'data' contains the list
      if (responseDataList != null) {
        List<Data> dataList = responseDataList
            .map((response) => Data.fromJson(response))
            .toList();
        GetAllBookDataModel temp = GetAllBookDataModel(data: dataList);
        dev.log("$responseDataList");
        if (temp.data != null && temp.data!.isNotEmpty) {
          await setallBookDataModel(temp);
        } else {
          dev.log("No data found");
        }
      } else {
        dev.log("Data is null or not a list");
      }
    } catch (e) {
      dev.log("$e");
    } finally {
      setloadingHomepageData(false);
    }
  }

  GetAllBookDataModel? allBookDataModel;
  GetAllBookDataModel? get getallBookDataModel => allBookDataModel;
  setallBookDataModel(val) {
    allBookDataModel = val;
    notifyListeners();
  }

  String userEmail = "Email";
  profileDetails(context) async {
    String? email = await storage.read(key: kEmail);
    userEmail = email.toString();
  }

  //Share Document
  Future<void> shareRecord(BuildContext context, String? url) async {
    await Share.share(
      "$url",
      subject: 'Share News',
      sharePositionOrigin: Rect.fromCircle(center: (Offset.zero), radius: 20),
    );
  }

  //PDF Veiw in web
  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
