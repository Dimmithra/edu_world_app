import 'package:edu_world_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert eduWorldMessage(
  context, {
  required String errorTxt,
  bool showIcon = true,
  int btnType = 1,
  List<DialogButton>? buttons,
}) =>
    Alert(
      onWillPopActive: buttons != null,
      context: context,
      style: const AlertStyle(
        backgroundColor: Colors.white,
      ),
      closeIcon: Container(),
      content: Column(
        children: [
          if (showIcon)
            Icon(
              btnType == 1
                  ? Ionicons.alert_circle
                  : btnType == 2
                      ? Ionicons.warning
                      : Ionicons.information_circle,
              color: btnType == 1
                  ? kErrorColor
                  : btnType == 2
                      ? Colors.amber
                      : kSuccessColor,
              size: 50,
            ),
          if (showIcon)
            Text(
              btnType == 1
                  ? 'Error Message'
                  : btnType == 2
                      ? "Warning Message"
                      : "Information",
              style: TextStyle(
                color: btnType == 1
                    ? kErrorColor
                    : btnType == 2
                        ? Colors.amber
                        : kSuccessColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          Text(
            errorTxt,
            style: TextStyle(
              fontSize: 17,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
      buttons: buttons ?? [],
    );
