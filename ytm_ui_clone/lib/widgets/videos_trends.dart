import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytm_ui_clone/controllers/trends_controller.dart';

import '../models/trends.dart';

class VideosTrendsWidget extends StatelessWidget {
  VideosTrendsWidget({Key? key}) : super(key: key);
  final TrendController trendController = Get.put(TrendController());
  // final SliverGridDelegate gridDelegate = SliverGridDelegate();
  @override
  Widget build(BuildContext context) {
    print(trendController.videosTrend?.items[0].title.toString());
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('INICIAR RÁDIO COM UMA MÚSICA',
                        style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.color
                                ?.withOpacity(0.7))),
                    Text('Escolhas rápidas',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendController.videosTrend?.items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, mainAxisExtent: 330),
                      itemBuilder: (context, index) {
                        final OfTypeSongs song =
                            trendController.videosTrend?.items[index];
                        // it is not a good ideia to wrap a widget with expanded or Flexible inside a GridView builder
                        return ListTile(
                          leading: Image.network(
                            song.thumbnails![0].url,
                          ),
                          title: Text(song.title ?? "", maxLines: 2),
                          subtitle: Text(song.artists?.join().toString() ?? "",
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
