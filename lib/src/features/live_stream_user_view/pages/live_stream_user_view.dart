import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/pk/widgets/heart_pop.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/const/app_images.dart';
import '../../audio_live/pages/live_audio_chat_expanded/view/audio_drawer.dart';
import '../../audio_live/pages/live_audio_chat_expanded/view/custom_header.dart';
import '../widgets/chat_and_circles_widget.dart';
import '../widgets/disclaimer_and_seats_widget.dart';
import '../widgets/userview_audio_bottomsheet.dart';
import 'package:flutter_svg/svg.dart';

class LiveStreamUserView extends StatefulWidget {
  const LiveStreamUserView({super.key});
  @override
  State<LiveStreamUserView> createState() => _LiveStreamUserViewState();
}

class _LiveStreamUserViewState extends State<LiveStreamUserView> {
  bool showChatAndCircles = true;
  bool isBottomIconClicked = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<HeartPopWidgetState> heartPopKey =
        GlobalKey<HeartPopWidgetState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SizedBox(
          height: height,
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.userViewBackground),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Expanded(
                      child: showChatAndCircles
                          ? ChatandcirclesWidgets(height: height, width: width)
                          : DisclaimerAndSeatsWidget(
                              height: height, width: width),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                left: 0,
                right: 0,
                child: LiveAudioChatHeader(scaffoldKey: _scaffoldKey),
              ),
              Positioned(
                right: 0,
                bottom: 50,
                child: IgnorePointer(
                  child: HeartPopWidget(
                    key: heartPopKey,
                  ),
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                right: 20.0,
                child: UserViewAudioBottomSheet(
                    heartpopkey: heartPopKey,
                    showChatAndCircles: showChatAndCircles),
              ),
              Positioned(
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isBottomIconClicked = !isBottomIconClicked;
                      showChatAndCircles = !showChatAndCircles;
                    });
                  },
                  child: SvgPicture.asset(
                    isBottomIconClicked ? AppIcons.iconTop : AppIcons.bottom,
                  ),
                ),
              )
            ],
          ),
        ),
        endDrawer: const AudioLiveDrawer(),
      ),
    );
  }
}
