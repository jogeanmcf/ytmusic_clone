import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ytm_ui_clone/api/api_conection.dart';
import 'package:ytm_ui_clone/main.dart';
import 'package:ytm_ui_clone/models/yt_search.dart';
import 'package:ytm_ui_clone/widgets/choice_chip_list.dart';
import 'package:ytm_ui_clone/widgets/search_field.dart';

import '../controllers/search_controller.dart';

//TODO: Adicionar principal resultado

class SearchResult extends StatelessWidget {
  final searchController = Get.find<SearchController>();

  SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: searchController,
        builder: (context) {
          return Scaffold(
              appBar: AppBar(
                title: SearchField(),
              ),
              body: searchController.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Body(searchResult: searchController.searchResult));
        });
  }
}

class Body extends StatefulWidget {
  List<YTSearch> searchResult;

  Body({Key? key, required this.searchResult}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late TabController tabController;
  final List<String> _filters = [
    "Songs",
    "Videos",
    "Community playlists",
    "Artists",
    "Albums"
  ];
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _list = [
      BlocCategory(search: widget.searchResult, category: "Songs"),
      BlocCategory(search: widget.searchResult, category: "Videos"),
      BlocCategory(
          search: widget.searchResult, category: "Community playlists"),
      BlocCategory(search: widget.searchResult, category: "Artists"),
      BlocCategory(search: widget.searchResult, category: "Albums")
    ];
    return Column(
      children: [
        TabBar(controller: tabController, tabs: const [
          Tab(icon: Text('YT MUSIC')),
          Tab(icon: Text('LIBRARY')),
        ]),
        SizedBox(height: 44, child: ChoiceChipList(_filters)),
        Divider(),
        Expanded(
          child: TabBarView(controller: tabController, children: [
            SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: _list)),
            Center(child: Icon(Icons.abc)),
          ]),
        ),
      ],
    );
  }
}

class YTSearchItemWidget extends StatelessWidget {
  final YTSearch ytSearch;
  const YTSearchItemWidget({Key? key, required this.ytSearch})
      : super(key: key);

  bool isArtist(String text) {
    return text == "Artists" ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isArtist(ytSearch.category)
          ? CircleAvatar(
              foregroundImage: NetworkImage(ytSearch.thumbnails![0].url))
          : Image.network(
              ytSearch.thumbnails![0].url,
              width: 40,
            ),
      title: isArtist(ytSearch.category)
          ? Text(ytSearch.artist ?? "", maxLines: 2)
          : Text(ytSearch.title ?? '', maxLines: 2),
      subtitle: isArtist(ytSearch.category)
          ? Text(
              ytSearch.artist!,
              style: TextStyle(
                  color: Theme.of(context)
                      .listTileTheme
                      .textColor!
                      .withOpacity(0.6)),
            )
          : Text(
              // TODO: não aparecer o bullet se a lista de artistas é nula
              "${ytSearch.resultType} • ${ytSearch.artists?.map((e) => e.name).toList().join(" & ") ?? ""}",
              style: TextStyle(
                  color: Theme.of(context)
                      .listTileTheme
                      .textColor!
                      .withOpacity(0.6))),
      trailing: Icon(Icons.more_vert),
    );
  }
}

class BlocCategory extends StatelessWidget {
  final String category;
  final List<YTSearch> search;
  const BlocCategory({required this.search, required this.category, Key? key})
      : super(key: key);

  List<YTSearch> filter(String text) {
    return search.where((item) => item.category == text).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _list = filter(category)
        .map<Widget>((e) => YTSearchItemWidget(ytSearch: e))
        .toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10),
        ListTile(
          leading: Text(
            category,
            style: TextStyle(fontSize: 20),
          ),
          trailing: Icon(Icons.keyboard_arrow_right), // mudar isso
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: _list,
        )
      ],
    );
  }
}
