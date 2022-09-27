import 'package:get/get.dart';

import '../api/api_conection.dart';
import '../models/trends.dart';

class TrendController extends GetxController {
  bool isLoading = true;
  Trends<dynamic>? songsTrend;
  Trends<dynamic>? videosTrend;
  Trends<dynamic>? artistsTrend;

  @override
  void onInit() async {
    super.onInit();
    // final Map<String, dynamic> data = await API.getTrends();

    // songsTrend = Trends.fromJson<OfTypeSongs?>(data);
    // videosTrend = Trends.fromJson<OfTypeVideos?>(data);
    // artistsTrend = Trends.fromJson<OfTypeVideos>(data);
    // isLoading = false;
    // update();

    API.getTrends().then((data) => {
          videosTrend = Trends.fromJson<OfTypeVideos?>(data, 'videos'),
          artistsTrend = Trends.fromJson<OfTypeArtists?>(data, 'artists'),
          songsTrend = Trends.fromJson<OfTypeSongs?>(data, 'songs'),
          isLoading = false,
          update(),
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
