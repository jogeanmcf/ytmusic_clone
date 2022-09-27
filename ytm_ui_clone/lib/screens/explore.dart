import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytm_ui_clone/widgets/custom_appBar.dart';
import 'package:ytm_ui_clone/widgets/mood_and_genres.dart';
import 'package:ytm_ui_clone/widgets/songs_trends.dart';
import 'package:ytm_ui_clone/widgets/videos_trends.dart';

import '../controllers/explore_controller.dart';

//TODO: Mudar icones (lançamentos, paradas, etc)
//TODO: Adicionar top  musics
//TODO: Adicionar em alta

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
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Paradas'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Momentos e gêneros'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(
            thickness: 0.3,
          ),
          MoodsAndGenresWidget(exploreController.moodsAndGenres),
          SongsTrendsWidget()
        ])
      ]),
    );
  }
}
