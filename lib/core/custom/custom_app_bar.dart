import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/custom/notifications_bottom_sheet.dart';
import 'package:weather_app/models/notification_model.dart';
import 'package:weather_app/providers/city_name_provider.dart';
import 'package:weather_app/views/search_view.dart';

AppBar customAppBar(BuildContext context,
    {
    List<NotificationModel>? notifications}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const SearchView();
          },
        ));
      },
      icon: const Icon(
        Icons.search,
        color: Colors.white,
      ),
    ),
    title: Row(
      children: [
        Consumer<CityNameProvider>(
          builder: (context, provider, child) {
            return Text(
              provider.cityName ?? '',
              style: const TextStyle(color: Colors.white),
            );
          },
        ),
        const SizedBox(width: 10),
        const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {
          showNotificationsBottomSheet(context, notifications);
        },
        icon: const Icon(
          Icons.notifications_none_rounded,
          color: Colors.white,
        ),
      ),
    ],
  );
}
