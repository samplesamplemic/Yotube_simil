//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quack_pics/view/assets/ConstantUI.dart';

import '../../../../Model/Video.dart';

class VideoCard extends StatefulWidget {
  final AsyncSnapshot<Video> snapshot;
  final int index;

  const VideoCard({super.key, required this.snapshot, required this.index});

  @override
  State<StatefulWidget> createState() => _VideoCard();
}

class _VideoCard extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: ClipRRect(
          borderRadius: ConstantUI.borderRadius,
          child: GridTile(
            header: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(widget.snapshot.data!.items[widget.index].snippet.channelTitle),
              subtitle: Text(widget.snapshot.data!.items[widget.index].snippet.publishTime
                  .toString()
                  .substring(0, 10)),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(
                  (HtmlUnescape()
                      .convert(widget.snapshot.data!.items[widget.index].snippet.title)),
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  widget.snapshot.data!.items[widget.index].snippet.thumbnailsOption
                              .defaultOption.url == null
                      ? widget.snapshot.data!.items[widget.index].snippet.thumbnailsOption
                          .medium.url
                      : widget.snapshot.data!.items[widget.index].snippet.thumbnailsOption
                          .high.url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}
