import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hiberus_ttf/presentation/components/basic_image_error.dart';

class MtgCardWidget extends StatelessWidget {
  final String name;
  final String ruleText;
  final String imageUrl;

  const MtgCardWidget(
      {super.key,
      required this.name,
      required this.ruleText,
      required this.imageUrl});

  //Handling faulted image fetch
  Widget _showImage(String imUrl) {
    try {
      return imageUrl.isEmpty
          ? Image.asset("assets/images/mtgBack.jpg")
          : CachedNetworkImage(
              placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl: imageUrl,
              errorWidget: (context, url, error) => const BasicImageError(),
            );
    } on Exception {
      return Image.asset("assets/images/mtgBackError.jpg");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        _showImage(imageUrl),
        Text(name),
        Text(ruleText),
      ]),
    );
  }
}
