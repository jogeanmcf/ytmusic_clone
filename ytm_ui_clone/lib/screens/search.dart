import 'package:flutter/material.dart';
import 'package:ytm_ui_clone/widgets/search_field.dart';

//TODO: Adicionar histórico de buscas
//TODO: Adicionar sugestões

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchField(),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.mic))
        ],
      ),
    );
  }
}
