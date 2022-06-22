import 'package:flutter/material.dart';

import '../screens/search.dart';

class CustomAppBar extends AppBar {
  final BuildContext context;
  CustomAppBar(this.context)
      : super(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset('assets/ytm-logo.png', width: 32, height: 32),
              //todo: mudar o estilo do "Music"
              Text('Music', style: TextStyle(fontSize: 24))
            ],
          ),
          actions: [
            Icon(Icons.cast),
            SizedBox(width: 15),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
            SizedBox(width: 15),
            CircleAvatar(),
            SizedBox(width: 15)
          ],
          //   );
        );
}
