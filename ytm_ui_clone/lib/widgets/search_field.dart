import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';
import '../screens/search_result.dart';

//TODO: adicionar x para limpar texto
class SearchField extends StatelessWidget {
  SearchField({Key? key});
  final textController = TextEditingController();
  final searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 36,
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: textController,
        onSubmitted: (text) {
          searchController.search(text);
          searchController.isLoading = true;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchResult(),
              ));
        },
        decoration: const InputDecoration(

            // focusColor: Colors.transparent,

            // suffix: textController.text != null ? Icon(Icons.close) : null,
            hintText: 'Search songs, albums, artist'),
      ),
    );
  }
}
