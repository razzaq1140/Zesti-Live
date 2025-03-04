import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/const/global_variables.dart';
import '../../router/go_route.dart';

class LiveOptionScreen extends StatelessWidget {
  const LiveOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorScheme(context).primary,
        title: Text(
          'Live Options',
          style: textTheme(context)
              .titleSmall
              ?.copyWith(color: colorScheme(context).onPrimary),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.screen_rotation),
            title: const Text('Broadcast Live Audio'),
            onTap: () {
              context.pushNamed(AppRoute.audioLive);
            },
          ),
          ListTile(
            leading: const Icon(Icons.mobile_screen_share_sharp),
            title: const Text('Join Live Video'),
            onTap: () {
              context.pushNamed(AppRoute.videolivestartscreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.gamepad),
            title: const Text('Broadcaste Live Game'),
            onTap: () {
              context.pushNamed(AppRoute.mobileLivePage);
            },
          ),
        ],
      ),
    );
  }
}
