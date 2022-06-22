import 'package:flutter/material.dart';
import 'package:ytm_ui_clone/models/mood_and_genres.dart';

class MoodsAndGenresWidget extends StatelessWidget {
  final List<MoodAndGenre> moodsAndGenres;
  const MoodsAndGenresWidget(this.moodsAndGenres, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: o grid não está funcionando

    return SizedBox(
      width: double.infinity,
      height: 250,
      child: GridView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // childAspectRatio: 3 / 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        children: moodsAndGenres.map<Widget>((e) {
          return Container(
              width: 78,
              height: 30,
              // margin: const EdgeInsets.all(12),
              alignment: Alignment.centerLeft,
              child: Text(e.title),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color.fromARGB(255, 87, 87, 87),
                  border:
                      Border(left: BorderSide(color: Colors.amber, width: 4))));
        }).toList(),
      ),
    );
  }
}
