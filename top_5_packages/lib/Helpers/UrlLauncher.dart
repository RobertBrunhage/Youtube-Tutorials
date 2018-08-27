import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class UrlLauncher{
  launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchInWebViewOrVC() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}