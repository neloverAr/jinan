import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  final String urlVideo;
  const YoutubeVideoPlayer({Key? key, required this.urlVideo})
      : super(key: key);

  @override
  State<YoutubeVideoPlayer> createState() =>
      _YoutubeVideoPlayerState(urlVideo: urlVideo);
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  final String urlVideo;
  _YoutubeVideoPlayerState({required this.urlVideo});
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(urlVideo) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
      ),
    );
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //   ]);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 500,
      height: 180,
      child: YoutubePlayer(
        controller: controller,
        liveUIColor: Colors.amber,
      ),
    );
  }
}