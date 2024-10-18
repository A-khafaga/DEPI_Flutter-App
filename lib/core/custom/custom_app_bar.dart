import 'package:flutter/material.dart';
import 'package:weather_app/views/search_view.dart';

AppBar customAppBar(BuildContext context, {required String cityName}) {
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
        Text(
          cityName,
          style: const TextStyle(color: Colors.white),
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
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_none_rounded,
          color: Colors.white,
        ),
      ),
    ],
  );
}
