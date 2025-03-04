import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MusicListSelectAll extends StatefulWidget {
  const MusicListSelectAll({super.key});

  @override
  State<MusicListSelectAll> createState() => _MusicListSelectAllState();
}

class _MusicListSelectAllState extends State<MusicListSelectAll> {
  int? _selectedIndex;

  void _onTileTap(int index) {
    setState(() {
      // Toggle selection: If tapped again, it will deselect
      _selectedIndex = _selectedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        iconTheme:
            IconThemeData(color: colorScheme(context).onPrimary, size: 18),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(context);
          },
        ),
        title: Text(
          "My Music (8)",
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
      body: ListView(
        children: [
          ListTile(
            leading: GestureDetector(
                onTap: () =>
                    context.pushNamed(AppRoute.musicListHollywoodmusic),
                child: SvgPicture.asset(AppIcons.folder)),
            title: Text(
              "Bollywood",
              style: textTheme(context)
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "66 songs",
              style: textTheme(context).bodySmall?.copyWith(
                    color: AppColor.textGrey,
                  ),
            ),
            trailing: _selectedIndex == 0
                ? Icon(
                    Icons.check,
                    color: colorScheme(context).primary,
                    size: 20,
                  )
                : null,
            onTap: () => _onTileTap(0),
          ),
          const Divider(),
          ListTile(
            leading: GestureDetector(
                onTap: () =>
                    context.pushNamed(AppRoute.musicListHollywoodmusic),
                child: SvgPicture.asset(AppIcons.folder)),
            title: Text(
              "Hollywood",
              style: textTheme(context)
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "441 songs",
              style: textTheme(context).bodySmall?.copyWith(
                    color: AppColor.textGrey,
                  ),
            ),
            trailing: _selectedIndex == 1
                ? Icon(
                    Icons.check,
                    color: colorScheme(context).primary,
                    size: 20,
                  )
                : null,
            onTap: () => _onTileTap(1),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        onPressed: () {},
        backgroundColor: colorScheme(context).primary,
        child: const Icon(
          Icons.arrow_forward,
        ),
      ),
    );
  }
}
