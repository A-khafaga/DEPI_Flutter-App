import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/custom/database_exception.dart';
import 'package:weather_app/models/notification_model.dart';
import 'package:weather_app/services/database_helper.dart';

class NotificationProivder extends ChangeNotifier {
  List<NotificationModel> notifications = [];
  late DatabaseHelper databaseHelper;
  NotificationProivder() {
    databaseHelper = DatabaseHelper();
    getNotifications();
  }

  Future<void> getNotifications() async {
    print('localllllll');
    try {
      print('gettttttttttt');

      notifications = await databaseHelper.getNotifications();
      print('notifs ${notifications.length}');
      notifyListeners();
    } catch (e) {
      print('errorrrr');
      throw DatabaseCustomException(e.toString());
    }
  }

  Future<void> insertNotif(NotificationModel notif) async {
    try {
      await databaseHelper.insertNotification(notif);
      print('inserttt');
      await getNotifications();
    } catch (e) {
      print('errorrrr');
      throw DatabaseCustomException(e.toString());
    }
    notifyListeners();
  }
}
