import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

class MusicListHollyWoodMusic extends StatefulWidget {
  const MusicListHollyWoodMusic({super.key});

  @override
  _MusicListHollyWoodMusicState createState() =>
      _MusicListHollyWoodMusicState();
}

class _MusicListHollyWoodMusicState extends State<MusicListHollyWoodMusic> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _selectedIndex;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isPlaying = false;

  final List<Map<String, String>> _songs = [
    {"title": "Starboy", "artist": "The Weeknd", "path": AppMusic.music1},
    {"title": "Party Monster", "artist": "The Weeknd", "path": AppMusic.music2},
    {"title": "Party", "artist": "Ahmer", "path": AppMusic.music3},
    {"title": "Party", "artist": "Ahmer", "path": AppMusic.music3},
    {"title": "Party", "artist": "Ahmer", "path": AppMusic.music3},
    // {"title": "Party", "artist": "Ahmer", "path": AppMusic.music3},
    // {"title": "Party", "artist": "Ahmer", "path": AppMusic.music3},
    // {"title": "Party", "artist": "Ahmer", "path": AppMusic.music3},
    // {"title": "Party", "artist": "Ahmer", "path": AppMusic.music3},
    // {"title": "Party", "artist": "Ahmer", "path": AppMusic.music3},
    {
      "title": "Simple music",
      "artist": "Arshad Hashmi",
      "path": AppMusic.music4
    },
  ];

  @override
  void initState() {
    super.initState();
    _setupAudioSession();
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });
    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _totalDuration = duration ?? Duration.zero;
      });
    });
    _audioPlayer.playingStream.listen((isPlaying) {
      setState(() {
        _isPlaying = isPlaying;
      });
    });
  }

  Future<void> _setupAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
  }

  void _onTileTap(int index) async {
    if (_selectedIndex == index && _isPlaying) {
      _audioPlayer.pause();
    } else {
      await _audioPlayer.setAsset(_songs[index]["path"]!);
      _audioPlayer.play();
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme(context).primary,
          iconTheme:
              IconThemeData(color: colorScheme(context).onPrimary, size: 20),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop(context);
            },
          ),
          title: Text(
            "My Music (${_songs.length})",
            style: textTheme(context).bodyMedium?.copyWith(
                color: colorScheme(context).onPrimary,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.sync),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {},
            ),
          ],
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                children: _songs.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, String> song = entry.value;
                  return Column(
                    children: [
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(AppImages.musicimg))),
                        ),
                        title: Text(
                          song["title"]!,
                          style: textTheme(context)
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${song["title"]!} - ${song["artist"]}",
                          style: textTheme(context)
                              .bodySmall
                              ?.copyWith(color: AppColor.textGrey),
                        ),
                        trailing: _selectedIndex == index
                            ? Icon(
                                Icons.check,
                                color: colorScheme(context).primary,
                              )
                            : null,
                        onTap: () => _onTileTap(index),
                      ),
                      const Divider(),
                    ],
                  );
                }).toList(),
              ),
            ),
            if (_selectedIndex != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 120,
                  color: AppColor.tagBlue,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 49,
                                width: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: colorScheme(context).onPrimary)),
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      _isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      if (_isPlaying) {
                                        _audioPlayer.pause();
                                      } else {
                                        _audioPlayer.play();
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  children: [
                                    Text(
                                      "${_songs[_selectedIndex!]["title"]} - ${_songs[_selectedIndex!]["artist"]}",
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                              color: colorScheme(context)
                                                  .onPrimary),
                                    ),
                                    Row(
                                      children: [
                                        SliderTheme(
                                          data:
                                              SliderTheme.of(context).copyWith(
                                            trackHeight: 2.0,

                                            thumbShape:
                                                const RoundSliderThumbShape(
                                                    enabledThumbRadius:
                                                        6.0), // Smaller thumb size
                                          ),
                                          child: Slider(
                                            value: _currentPosition.inSeconds
                                                .toDouble(),
                                            max: _totalDuration.inSeconds
                                                .toDouble(),
                                            onChanged: (value) {
                                              _audioPlayer.seek(Duration(
                                                  seconds: value.toInt()));
                                            },
                                            activeColor:
                                                colorScheme(context).onPrimary,
                                            inactiveColor: Colors.white24,
                                          ),
                                        ),
                                        SvgPicture.asset(AppIcons.speaker)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(width: 17),
                                        Text(
                                          _formatDuration(_currentPosition),
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                  color: colorScheme(context)
                                                      .onPrimary),
                                        ),
                                        const SizedBox(width: 100),
                                        Text(
                                          "-${_formatDuration(_totalDuration - _currentPosition)}",
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                  color: colorScheme(context)
                                                      .onPrimary),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
          ]),
        ));
  }
}
