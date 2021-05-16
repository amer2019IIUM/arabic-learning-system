import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  VideoPlayerController playerController;
  VoidCallback listener;

  YoutubePlayerController _playerController = YoutubePlayerController(
      initialVideoId: 'fRRCRVoMjWI',
      flags: YoutubePlayerFlags(autoPlay: true, mute: false));

  void runYoutubeplayer() {
    _playerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
            'https://www.youtube.com/watch?v=UDxT0BCvllg'),
        flags: YoutubePlayerFlags(
            enableCaption: false, isLive: false, autoPlay: false));
  }

  @override
  void initState() {
    runYoutubeplayer();
    super.initState();
  }

  @override
  void deactivate() {
    _playerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _playerController,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Video'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [player, Text('Hello')],
            ),
          ),
        );
      },
    );
  }
}
