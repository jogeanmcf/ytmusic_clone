import 'package:get/get.dart';

import '../api/api_conection.dart';
import '../models/trends.dart';

class TrendController extends GetxController {
  bool isLoading = true;
  Trends? songsTrend;
  Trends? videosTrend;
  Trends? artistsTrend;

  @override
  void onInit() async {
    // songsTrend = await API.getSongsTrends();
    API.getVideosTrends().then((trend) {
      videosTrend = trend;

      update();
      notifyChildrens();
    });
    artistsTrend = await API.getArtistsTrends();
    isLoading = !isLoading;

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
