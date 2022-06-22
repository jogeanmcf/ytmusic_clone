import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytm_ui_clone/widgets/custom_appBar.dart';
import 'package:ytm_ui_clone/widgets/mood_and_genres.dart';

import '../controllers/explore_controller.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);
  final ExploreController exploreController = Get.put(ExploreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: ListView(shrinkWrap: true, children: [
        Column(children: [
          const ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Lamçamentos'),
          ),
          const ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Paradas'),
          ),
          const ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Momentos e gêneros'),
          ),
          MoodsAndGenresWidget(exploreController.moodsAndGenres)
        ])
      ]),
    );
  }
}
