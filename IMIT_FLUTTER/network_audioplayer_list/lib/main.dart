import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = Duration();
  Duration postion = Duration();

  bool playing = false;

  List songs = [
    "https://assets.mixkit.co/music/preview/mixkit-trip-hop-vibes-149.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3",
    "https://assets.mixkit.co/music/preview/mixkit-trip-hop-vibes-149.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (BuildContext, index) {
              return Center(
                child: SizedBox(
                  height: 100,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (playing) {
                              var res = await audioPlayer.pause();
                              if (res == 1) {
                                setState(() {
                                  playing = false;
                                });
                              }
                            } else {
                              var res = await audioPlayer.play(songs[index],
                                  isLocal: true);
                              if (res == 1) {
                                setState(() {
                                  playing = true;
                                });
                              }
                            }

                            audioPlayer.onDurationChanged.listen((Duration dd) {
                              setState(() {
                                duration = dd;
                              });
                            });

                            audioPlayer.onAudioPositionChanged
                                .listen((Duration dd) {
                              setState(() {
                                postion = dd;
                              });
                            });
                          },
                          child: Icon(
                            playing == false
                                ? Icons.play_circle_fill_outlined
                                : Icons.pause_circle_filled_outlined,
                            size: 50,
                          ),
                        ),
                        Slider.adaptive(
                            min: 0.0,
                            value: postion.inSeconds.toDouble(),
                            max: duration.inSeconds.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                audioPlayer
                                    .seek(Duration(seconds: value.toInt()));
                              });
                            })
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Widget slider() {
    return Slider.adaptive(
        min: 0.0,
        value: postion.inSeconds.toDouble(),
        max: duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            audioPlayer.seek(Duration(seconds: value.toInt()));
          });
        });
  }

  void getAudio({var songUrl}) async {
    // var url =
    //     "https://assets.mixkit.co/music/preview/mixkit-trip-hop-vibes-149.mp3";

    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(songUrl, isLocal: true);

      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }

    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        postion = dd;
      });
    });
  }
}
