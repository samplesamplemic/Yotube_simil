import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoSetting {
  static String get videoId => '';

  static get _controller => YoutubePlayerController.fromVideoId(
    videoId: videoId,
    params: const YoutubePlayerParams(
      mute: false,
      showControls: true,
      showFullscreenButton: true,
      showVideoAnnotations: true,
    ),
  );
}
