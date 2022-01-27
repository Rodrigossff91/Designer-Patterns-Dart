import 'package:compositepatterndart/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FeedYoutube extends Feed {
  final String text;
  final String videoId;
  final YoutubePlayerController _controller;

  FeedYoutube({required this.text, required this.videoId})
      : _controller = YoutubePlayerController(
            initialVideoId: videoId,
            flags: YoutubePlayerFlags(autoPlay: false));

  @override
  Widget renderContent() {
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        super.renderContent()
      ],
    );
  }
}
