import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../Model/Video.dart';

class VideoPlay extends StatefulWidget {
  final Items? videoItem;

  VideoPlay({required this.videoItem});

  @override
  State<StatefulWidget> createState() => _VideoPlay();
}

class _VideoPlay extends State<VideoPlay> {
  late YoutubePlayerController _controller;
  late bool _isPlayerReady;

  @override
  void initState() {
    super.initState();
    _isPlayerReady = false;
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoItem!.id.videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.videoItem!.snippet.title)),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: YoutubePlayer(
              controller: _controller,
            ),
          ),
        ));
  }
}
