import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

class NotificationManager extends ChangeNotifier {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();
  bool activated = true;

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
      _notifications.show(
          id,
          title,
          body,
          await _notificationDetails(),
          payload: payload
      );
    }

    void setNotificationState(bool value){
      activated = value;
      notifyListeners();
    }


  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);

    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async {
        onNotifications.add(payload);
      },
    );
  }

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android:  AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max
      ),
    iOS: IOSNotificationDetails()
    );
  }
}