import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/models/notification_model.dart';

void showNotificationsBottomSheet(BuildContext context, List<NotificationModel>? notifications) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: notifications?.length,
          itemBuilder: (context, index) {
            final notification = notifications![index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(notification.id.toString()),
              ),
              title: Text(notification.title),
              subtitle: Text(notification.description),
            );
          },
        );
      });
}
