import 'package:flutter/material.dart';
import 'package:ytmusic_clone/widgets/custom_appBar.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: Column(children: [
        Column(children: [
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Lamçamentos'),
          ),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Paradas'),
          ),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Momentos e gêneros'),
          ),
        ])
      ]),
    );
  }
}
