import 'package:compositepatterndart/feed/feed.dart';
import 'package:flutter/material.dart';

class FeedImage extends Feed {
  final String text;
  final String url;

  FeedImage({required this.text, required this.url}) : super(text: text);

  @override
  Widget renderContent() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
        ),
        super.renderContent()
      ],
    );
  }
}
