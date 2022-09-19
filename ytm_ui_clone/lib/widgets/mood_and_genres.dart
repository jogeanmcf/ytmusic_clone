import 'package:flutter/material.dart';
import 'package:ytm_ui_clone/models/mood_and_genres.dart';

class MoodsAndGenresWidget extends StatelessWidget {
  final List<MoodAndGenre> moodsAndGenres;
  MoodsAndGenresWidget(this.moodsAndGenres, {Key? key}) : super(key: key);
  final List<Color> moodAndGenresColors = [
    Colors.red,
    Colors.amber,
    Colors.green,
    Colors.grey,
    Colors.purple,
    Colors.lightBlue,
    Colors.blue,
    Colors.white,
    Colors.lightGreen
  ];
  @override
  Widget build(BuildContext context) {
    //TODO: o grid não está funcionando

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Moods and Genres',
                style: TextStyle(fontSize: 24),
              ),
              Spacer(),
              InkWell(
                //TODO: Mudar a fonte
                child: Text('More'),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: GridView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.35,
                crossAxisSpacing: 16,
                mainAxisSpacing: 0),
            children: moodsAndGenres.map<Widget>((e) {
              return Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.only(left: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(e.title),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color.fromARGB(255, 87, 87, 87),
                      border: Border(
                          left: BorderSide(
                              color: (moodAndGenresColors..shuffle()).first,
                              width: 6))));
            }).toList(),
          ),
        ),
      ],
    );
  }
}
