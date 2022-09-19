import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytm_ui_clone/api/api_conection.dart';
import 'package:ytm_ui_clone/screens/search_result.dart';
import 'package:ytm_ui_clone/widgets/search_field.dart';

import '../controllers/search_controller.dart';

//TODO: Adicionar histórico de buscas
//TODO: Adicionar sugestões
//TODO: adicionar x para limpar texto
//TODO: Adicionar microfone

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
