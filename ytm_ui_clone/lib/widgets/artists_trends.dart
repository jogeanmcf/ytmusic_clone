import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytm_ui_clone/controllers/trends_controller.dart';

import '../models/trends.dart';

class ArtistsTrendsWidget extends StatelessWidget {
  ArtistsTrendsWidget({Key? key}) : super(key: key);
  final TrendController trendController = Get.put(TrendController());

  Widget _trend(String trend) {
    switch (trend) {
      case 'down':
        return const Icon(Icons.arrow_drop_down, color: Colors.red);
      case 'up':
        return const Icon(Icons.arrow_drop_up, color: Colors.green);
      default:
        return const Text(' • ',
            style: TextStyle(fontSize: 32, color: Colors.grey));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      height: 290,
      width: double.infinity,
      child: trendController.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text('Top musics',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600)),
                      Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: const InkWell(child: Text('More')))
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendController.artistsTrend?.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, mainAxisExtent: 330),
                      itemBuilder: (context, index) {
                        final OfTypeArtists artist =
                            trendController.artistsTrend?.items[index];
                        // it is not a good ideia to wrap a widget with expanded or Flexible inside a GridView builder
                        return ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(
                                artist.thumbnails[0].url,
                              ),
                              _trend(artist.trend),
                              Text(index.toString())
                            ],
                          ),
                          title: Text(artist.title, maxLines: 2),
                          // subtitle: Text(artist., maxLines: 1), // It seems the api dont get the artist music
                          trailing: const Icon(Icons.more_vert),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
