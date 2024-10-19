import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:weather_app/core/custom/database_exception.dart';
import 'package:weather_app/models/notification_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    try {
      _database = await _initDatabase();
    } on Exception catch (e) {
      throw DatabaseCustomException(e.toString());
    }
    return _database!;
  }

  // Convert List<int> to String (JSON format)
  String listToString(List<int> list) {
    return jsonEncode(list);
  }

// Convert String back to List<int>
  List<int> stringToList(String data) {
    return List<int>.from(jsonDecode(data));
  }

  Future<Database> _initDatabase() async {
    try {
      String path = join(await getDatabasesPath(), 'notifications.db');
      return openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute('''
          CREATE TABLE notification (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT
          )
        ''');
        },
      );
    } catch (e) {
      throw DatabaseCustomException(e.toString());
    }
  }

  Future<void> insertNotification(NotificationModel notification) async {
    try {
      final db = await database;
      await db.insert('notification', {
        'id': notification.id,
        'title': notification.title,
        'description': notification.description,
      });
    } catch (e) {
      throw DatabaseCustomException(e.toString());
    }
  }

  Future<List<NotificationModel>> getNotifications() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> notifMap =
          await db.query('notification');

      return notifMap.map((notif) {
        return NotificationModel(
          id: notif['id'] as int,
          title: notif['title'] as String,
          description: notif['description'] as String,
        );
      }).toList();
    } catch (e) {
      throw DatabaseCustomException(e.toString());
    }
  }
}
