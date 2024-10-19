import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/models/notification_model.dart';
import 'package:weather_app/providers/city_name_provider.dart';
import 'package:weather_app/providers/firebase_messaging_provider.dart';
import 'package:weather_app/providers/notification_proivder.dart';
import 'package:weather_app/services/local_notifications_service.dart';
import 'package:weather_app/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService().initNotification();
  if (Platform.isAndroid) {
    var fcmToken = await FirebaseMessaging.instance.getToken();
    print('fcm Token: $fcmToken');
  } else {
    print('iphone');
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FCMProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationProivder(),
        ),
        ChangeNotifierProvider(
          create: (_) => CityNameProvider(),
        ),
      ],
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    FCMProvider fcmProvider = Provider.of<FCMProvider>(context);
    NotificationProivder notificationProivder =
        Provider.of<NotificationProivder>(context);

    if (fcmProvider.notifMessage != null) {
      notificationProivder.insertNotif(NotificationModel(
          description: fcmProvider.notifMessage!.body!,
          title: fcmProvider.notifMessage!.title!));
      NotificationService().showNotification(
          title: fcmProvider.notifMessage?.title,
          body: fcmProvider.notifMessage?.body);
      fcmProvider.notifMessage = null;
    }
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition)),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.cyan;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.amber;
    case 'Cloudy':
    case 'Partly cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Rain':
    case 'Showers':
      return Colors.brown;
    case 'Thunderstorm':
      return Colors.deepPurple;
    case 'Snow':
      return Colors.green;
    case 'Fog':
      return Colors.blueGrey;
    case 'Light sleet':
      return Colors.orange;
    default:
      return Colors.blue;
  }
}
