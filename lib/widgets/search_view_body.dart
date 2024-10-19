import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/images_date.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/widgets/custom_search_bar.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black12,
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomeView();
                        },
                      ),
                    );
                  },
                ),
                const Expanded(
                  child: CustomSearchBar(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 60),
            child: Image.asset(
              ImagesDate.search
            ),
          ),
        ],
      ),
    );
  }
}
