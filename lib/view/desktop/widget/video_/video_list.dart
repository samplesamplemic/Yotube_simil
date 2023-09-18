import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quack_pics/view/assets/constantUI.dart';

import '../../../../Model/Video.dart';
import '../../../../api/FetchAPI.dart';
import 'videoCard.dart';
import 'videoPlay.dart';

class VideoList extends StatefulWidget {
  const VideoList(FetchAPI manager, {super.key});

  @override
  State<StatefulWidget> createState() => _VideoList();
}

class _VideoList extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    const test = ConstantUI;
    if (Provider.of<FetchAPI>(context, listen: false).dataExist) {
      return FutureBuilder<Video>(
          future: Provider.of<FetchAPI>(context, listen: false).videoList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenWidth > ConstantUI.responsiveWidth
                          ? ConstantUI.gridViewElementPerRowDesktop
                          : ConstantUI.gridViewElementPerRowMobile,
                      childAspectRatio: screenWidth > ConstantUI.responsiveWidth
                          ? (screenWidth /
                              (MediaQuery.of(context).size.height /
                                  ConstantUI.gridViewAspectRatioElementDesktop))
                          : screenWidth /
                              (MediaQuery.of(context).size.height /
                                  ConstantUI.gridViewAspectRatioElementMobile),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    String data = snapshot.data!.items[index].snippet.publishTime;
                    return InkWell(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return VideoPlay(videoItem: snapshot.data!.items[index]);
                        }));
                      },
                      child: VideoCard(snapshot: snapshot, index: index),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          });
    } else {
      return const Text('Search something :}');
    }
  }
}
