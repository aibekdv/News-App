import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsCashedImageWidget extends StatelessWidget {
  final String urlToImage;

  const NewsCashedImageWidget({super.key, required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlToImage,
      placeholder: (context, url) => const Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Image.network(
          'https://hellopoka.com/wp-content/uploads/2019/04/Marketplace-Lending-News-300x176.jpg'),
    );
  }
}
