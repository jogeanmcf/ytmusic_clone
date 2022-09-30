import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ytm_ui_clone/controllers/trends_controller.dart';

import '../models/trends.dart';

class SongsTrendsWidget extends StatelessWidget {
  SongsTrendsWidget({Key? key}) : super(key: key);
  final TrendController trendController = Get.put(TrendController());
  // final SliverGridDelegate gridDelegate = SliverGridDelegate();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, bottom: 20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start radio with a song',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.7))),
                      const Text('Quick choices',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600)),
                      // Container(
                      //     margin: EdgeInsets.only(right: 20),
                      //     child: Text('Mais'))
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendController.songsTrend?.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, mainAxisExtent: 330),
                      itemBuilder: (context, index) {
                        final OfTypeSongs song =
                            trendController.songsTrend?.items[index];
                        // it is not a good ideia to wrap a widget with expanded or Flexible inside a GridView builder
                        return ListTile(
                          leading: Image.network(
                            song.thumbnails?[0].url ?? "",
                          ),
                          title: Text(song.title ?? "", maxLines: 2),
                          subtitle: Text(song.artists?.join().toString() ?? "",
                              maxLines: 1),
                          trailing: const Icon(Icons.more_vert),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
