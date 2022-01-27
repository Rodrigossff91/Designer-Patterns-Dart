import 'package:compositepatterndart/feed/feed_image.dart';
import 'package:compositepatterndart/feed/feed_youtube.dart';
import 'package:compositepatterndart/feed/ifeed.dart';
import 'package:flutter/material.dart';

import 'feed/feed.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<IFeed> feed = [];

  @override
  void initState() {
    feed.add(Feed(text: "Enviar mensagem de texto"));
    feed.add(FeedImage(
        text: "Enviar mensagem de texto",
        url:
            'https://blog.emania.com.br/wp-content/uploads/2019/07/fotografo-capta-imagem-incrivel-do-eclipse-solar-no-chile-Blog-eMania-1-03-07-1024x683.jpg'));
    feed.add(FeedYoutube(text: "Youtube Videos", videoId: '1A3DSH_eLIQ'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: feed.length,
            itemBuilder: (context, index) {
              return feed[index].render();
            }));
  }
}
