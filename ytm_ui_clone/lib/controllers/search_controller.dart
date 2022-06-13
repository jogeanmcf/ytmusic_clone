import 'package:get/get.dart';
import '../api/api_conection.dart';
import '../models/yt_search.dart';

class SearchController extends GetxController {
  bool isLoading = true;
  String? searchText;
  List<YTSearch> searchResult = [];

  Future<List<YTSearch>> search(String text) => API.search(text).then((value) {
        isLoading = false;
        searchResult = value;
        update();
        return value;
      });
}
