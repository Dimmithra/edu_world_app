import 'package:edu_world_app/providers/home_provider.dart';
import 'package:edu_world_app/services/networkconnection_service.dart';
import 'package:edu_world_app/utils/color.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MainBody extends StatefulWidget {
  const MainBody({
    super.key,
    required this.body,
    required this.title,
    this.floatingActionButton,
    this.appBarColor,
    this.appbarTitleColor,
    this.automaticallyImplyLeading = false,
    this.drawer,
    this.iconThemeColor,
    this.bottomNavigationBar,
    this.actions,
    this.leading,
  });

  final Widget body;
  final String title;
  final Widget? floatingActionButton;
  final Color? appBarColor;
  final Color? appbarTitleColor;
  final bool automaticallyImplyLeading;
  final Widget? drawer;
  final Color? iconThemeColor;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;
  final Widget? leading;
  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  void initState() {
    // TODO: implement initState
    InternetConnectionChecker().isInternetAvailable(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          drawer: widget.drawer,
          appBar: AppBar(
            actionsIconTheme: const IconThemeData(weight: 10, size: 40),
            actions: widget.actions,
            backgroundColor: homeProvider.getDarkTheme
                ? appBarDarkModeColor
                : appBarLightModColor,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: widget.iconThemeColor ?? kdefWhiteColor,
            ),
            leading: widget.leading,
            automaticallyImplyLeading: widget.automaticallyImplyLeading,
            title: Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                color: widget.appbarTitleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: widget.body,
          floatingActionButton: widget.floatingActionButton,
          bottomNavigationBar: widget.bottomNavigationBar,
        );
      },
    );
  }
}
