import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytmusic_clone/api/api_conection.dart';
import 'package:ytmusic_clone/screens/search_result.dart';
import 'package:ytmusic_clone/widgets/search_field.dart';

import '../controllers/search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchField(),
      ),
    );
  }
}
