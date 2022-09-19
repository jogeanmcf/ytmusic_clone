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
    return SizedBox(
      height: 200,
      child: trendController.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendController.videosTrend?.items.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
              itemBuilder: (context, index) {
                final VideosTrend video =
                    trendController.videosTrend?.items[index];
                return ListTile(
                  leading: Image.network(
                    video.thumbnails[0].url,
                  ),
                  title: Text(video.title),
                  subtitle: Text(video.artists.join().toString()),
                );
              }),
    );
  }
}
