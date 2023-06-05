import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/pages/pages.dart';

class NewsItemWidget extends StatelessWidget {
  final ArticleModel newsItem;

  const NewsItemWidget({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contex) => DetailPage(
              article: newsItem,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 100,
        child: Card(
          color: Colors.grey[100],
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: CachedNetworkImage(
                  imageUrl: newsItem.urlToImage ??
                      'https://hellopoka.com/wp-content/uploads/2019/04/Marketplace-Lending-News-300x176.jpg',
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Image.network(
                      'https://redmondmag.com/-/media/ECG/visualstudiomagazine/Images/introimages/ErrorMessage.jpg'),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        newsItem.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        DateFormat.yMMMEd().format(
                          DateTime.parse(newsItem.publishedAt!),
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
