import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytm_ui_clone/controllers/home_controller.dart';
import 'package:ytm_ui_clone/models/get_home.dart';
import 'package:ytm_ui_clone/screens/search.dart';
import 'package:ytm_ui_clone/widgets/choice_chip_list.dart';
import '../widgets/songs_trends.dart';

//TODO: Adicionar parecido com
//TODO: Adicionar Explore (Lançamentos, Paradas)
//TODO: Rounded avatar para artistas

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
        ),
        SliverAppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          pinned: true,
          title: ChoiceChipList(options),
        ),
        homeController.isLoading
            ? const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()))
            : SliverList(
                delegate: SliverChildListDelegate([
                // find a way to loop throught the list
                ...homeController.homeContent
                    .map<Widget>(
                      (e) => Session(e),
                    )
                    .toList(),
                SongsTrendsWidget()
              ])),
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
      margin: const EdgeInsets.only(left: 20, top: 12, bottom: 24),
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
          const SizedBox(
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
