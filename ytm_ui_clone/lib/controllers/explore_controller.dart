import 'package:get/get.dart';
import 'package:ytm_ui_clone/models/mood_and_genres.dart';

import '../api/api_conection.dart';

class ExploreController extends GetxController {
  List<MoodAndGenre> moodsAndGenres = [];

  @override
  void onInit() {
    API.getMoodsAndGenres().then((value) {
      moodsAndGenres = value;
      update();
    });
    super.onInit();
  }
}
