import 'package:get/get.dart';
import 'package:ytm_ui_clone/models/get_home.dart';
import '../api/api_conection.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  List<HomeSession> homeContent = [];

  Future<List<HomeSession>> getHome() => API.getHome().then((value) {
        isLoading = false;
        homeContent = value;
        update();
        notifyChildrens();
        return value;
      });
}
