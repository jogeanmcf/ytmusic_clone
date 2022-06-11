import 'package:flutter/material.dart';

import '../screens/search.dart';

class CustomAppBar extends AppBar {
  final BuildContext context;
  CustomAppBar(this.context)
      : super(
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
