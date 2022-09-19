import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytm_ui_clone/controllers/home_controller.dart';
import 'package:ytm_ui_clone/models/get_home.dart';
import 'package:ytm_ui_clone/screens/search.dart';
import 'package:ytm_ui_clone/widgets/choice_chip_list.dart';

import '../widgets/videos_trends.dart';

//TODO: Adicionar esolhas rápidas
//TODO: Adicionar parecido com
//TODO: Adicionar Explore (Lançamentos, Paradas, Momentos e Generos)
//TODO: Rounded avatar para artistas

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> options = ['Training', 'Energy', 'Relax', 'In Transit', 'Focus'];

  // final homeControler = Get.put(HomeController());
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.getHome().then((value) => setState(() => {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset('assets/ytm-logo.png', width: 32, height: 32),
              //todo: mudar o estilo do "Music"
              Text('Music', style: TextStyle(fontSize: 24))
            ],
          ),
          actions: [
            const Icon(Icons.cast),
            const SizedBox(width: 15),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
            const SizedBox(width: 15),
            const CircleAvatar(),
            const SizedBox(width: 15)
          ],
        ),
        SliverAppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          pinned: true,
          title: ChoiceChipList(options),
        ),
        homeController.isLoading
            ? SliverToBoxAdapter(
                child: Container(
                    child: Center(child: CircularProgressIndicator())))
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      Session(homeController.homeContent[index]),
                      VideosTrendsWidget()
                    ],
                  );
                },
                childCount: 3,
              )),
      ],
    );
  }
}

class Session extends StatelessWidget {
  final HomeSession session;
  const Session(this.session, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              session.title ?? 'title',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(session.contents.length,
                  (index) => SquareBanner(session.contents[index]!))),
        ),
      ],
    );
  }
}

class SquareBanner extends StatelessWidget {
  final Content content;
  const SquareBanner(this.content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 12, bottom: 24),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.network(
              content.thumbnails![0].url,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 150,
            child: Text(
              content.title ?? 'asdfasdf',
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
