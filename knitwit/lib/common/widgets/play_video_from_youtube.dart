import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class PlayVideoFromYoutube extends StatefulWidget {
  const PlayVideoFromYoutube({
    super.key,
    required this.videoUrl
  });

  final String videoUrl;

  @override
  State<PlayVideoFromYoutube> createState() => _PlayVideoFromYoutubeState();
}

class _PlayVideoFromYoutubeState extends State<PlayVideoFromYoutube> {
  late final PodPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(widget.videoUrl),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: false,
        isLooping: true,
      )
    )..initialise().catchError((error) {
      debugPrint('Error initializing PodPlayerController: $error');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(controller: controller);
  }
}
