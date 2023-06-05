import 'package:flutter/material.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final someNewsKeys = <String>[
    'BBC',
    'CNN',
    'Apple',
    'Google',
  ];
  NewsModel? news;

  Future<void> getData({String? query}) async {
    if (query != null) {
      news = await FetchData().getAllNews(query: query);
      setState(() {});
    } else {
      news = await FetchData().getAllNews();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => someNewsKeys
                .map(
                  (item) => PopupMenuItem(
                    onTap: () => getData(query: item),
                    value: item,
                    child: Text(item),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: SizedBox(
        child: news == null
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : news!.articles!.isNotEmpty
                ? ListView.builder(
                    itemCount: news!.articles?.length,
                    itemBuilder: (context, index) {
                      final newsItem = news!.articles![index];
                      return NewsItemWidget(newsItem: newsItem);
                    },
                  )
                : const Center(
                    child: Text(
                      "News not found",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
      ),
    );
  }
}
