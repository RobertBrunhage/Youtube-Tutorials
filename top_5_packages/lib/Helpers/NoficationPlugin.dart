import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPlugin{
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  NotificationPlugin(){
    _initializeNotifications();
  }

  void _initializeNotifications() {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings initializationSettingsAndroid =
    new AndroidInitializationSettings('secondary_icon');
    IOSInitializationSettings initializationSettingsIOS =
    new IOSInitializationSettings();
    InitializationSettings initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        selectNotification: onSelectNotification);
  }

  Future showNotification() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      print('notification payload pressed: ' + payload);
    }
  }

}