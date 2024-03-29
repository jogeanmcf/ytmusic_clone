import 'package:flutter/material.dart';
import 'package:ytm_ui_clone/widgets/custom_appBar.dart';

//TODO: Adicionar Atividades recentes

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: Center(
        child: ListView(
          children: const [
            ListTile(
              leading: Icon(Icons.download_sharp),
              title: Text('Download'),
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: Icon(Icons.playlist_play),
              title: Text('Playlilst'),
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Download'),
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: Icon(Icons.album),
              title: Text('Album'),
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
                leading: Icon(Icons.cast),
                title: Text('Artist'),
                trailing: Icon(Icons.navigate_next)),
            ListTile(
                leading: Icon(Icons.subscriptions),
                title: Text('Subscription'),
                trailing: Icon(Icons.navigate_next))
          ],
        ),
      ),
    );
  }
}
