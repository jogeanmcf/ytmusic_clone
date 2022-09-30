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
              const Text('Music', style: TextStyle(fontSize: 24))
            ],
          ),
          actions: [
            const Icon(Icons.cast),
            const SizedBox(width: 15),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
            ),
            const SizedBox(width: 15),
            const Icon(Icons.account_circle, size: 30),
            const SizedBox(width: 15)
          ],
          //   );
        );
}
