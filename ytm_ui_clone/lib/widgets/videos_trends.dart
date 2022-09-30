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
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
      height: 290,
      width: double.infinity,
      child: trendController.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text('Top videos',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: const Text('More'))
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendController.videosTrend?.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, mainAxisExtent: 330),
                      itemBuilder: (context, index) {
                        final OfTypeVideos video =
                            trendController.videosTrend?.items[index];
                        // it is not a good ideia to wrap a widget with expanded or Flexible inside a GridView builder
                        return ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 60,
                                child: Image.network(
                                  video.thumbnails[0].url,
                                  scale: 1,
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(index.toString()))
                            ],
                          ),
                          title: Text(video.title, maxLines: 2),
                          subtitle: Text(
                            video.artists
                                .map((artist) => artist.name)
                                .join(' • '),
                            maxLines: 1,
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.7)),
                          ),
                          trailing: const Icon(Icons.more_vert),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
