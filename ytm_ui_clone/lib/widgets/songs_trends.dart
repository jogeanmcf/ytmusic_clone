import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytm_ui_clone/controllers/trends_controller.dart';

import '../models/trends.dart';

class SongsTrendsWidget extends StatelessWidget {
  SongsTrendsWidget({Key? key}) : super(key: key);
  final TrendController trendController = Get.put(TrendController());
  // final SliverGridDelegate gridDelegate = SliverGridDelegate();
  @override
  Widget build(BuildContext context) {
    print(trendController.songsTrend?.items[0].title.toString());
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20),
      height: 290,
      width: double.infinity,
      child: trendController.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Escolhas rápidas',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    Text('Mais'),
                    SizedBox(width: 20)
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendController.songsTrend?.items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, mainAxisExtent: 330),
                      itemBuilder: (context, index) {
                        final OfTypeVideos video =
                            trendController.songsTrend?.items[index];
                        // it is not a good ideia to wrap a widget with expanded or Flexible inside a GridView builder
                        return ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                video.thumbnails[0].url,
                              ),
                              SizedBox(width: 10),
                              Text(index.toString())
                            ],
                          ),
                          title: Text(video.title, maxLines: 2),
                          subtitle: Text(video.artists.join().toString(),
                              maxLines: 1),
                          trailing: Icon(Icons.more_vert),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
