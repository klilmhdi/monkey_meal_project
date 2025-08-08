import 'package:flutter/material.dart';

class Helper {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // navigate and finish pervious screen
  static navAndFinish(context, Widget) =>
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Widget), (route) {
        return false;
      });

  // just navigate for screen
  static navTo(context, Widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}
