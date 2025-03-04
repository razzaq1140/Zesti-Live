import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/matchmodal.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class PkScreen extends StatelessWidget {
  const PkScreen({super.key});
  void navigateToMatchScreen(BuildContext context, int index) {
    context.pushNamed(
      AppRoute.pkMatchScreen,
      pathParameters: {'index': index.toString()},
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
        itemCount: matchups.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateToMatchScreen(context, index),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                right: width / 2.8,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.horizontal(
                                      left: Radius.circular(15)),
                                  child: ClipPath(
                                    clipper: LeftClipper(),
                                    child: Image.network(
                                      matchups[index].leftUserImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              // Right image
                              Positioned.fill(
                                left: width / 2.3,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.horizontal(
                                      right: Radius.circular(15)),
                                  child: ClipPath(
                                    clipper: RightClipper(),
                                    child: Image.network(
                                      matchups[index].rightUserImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              //vs
                              Center(
                                child: Image.asset(
                                  AppImages.vs,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              //staryellow
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.starYellow),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(matchups[index].leftUserName,
                                        style: textTheme(context)
                                            .bodyMedium
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onPrimary)),
                                  ],
                                ),
                              ),
                              //starblue
                              Positioned(
                                bottom: 10,
                                left: (width / 2) + 10,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.starBlue),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(matchups[index].rightUserName,
                                        style: textTheme(context)
                                            .bodyMedium
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onPrimary)),
                                  ],
                                ),
                              ),
                              //lose
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Image.asset(AppImages.lose),
                              ),
                              //win
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset(AppImages.win),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //progress indicator
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        LinearProgressIndicator(
                          value: matchups[index].leftUserVotes /
                              (matchups[index].leftUserVotes +
                                  matchups[index].rightUserVotes),
                          backgroundColor: Colors.red,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.purple),
                          minHeight: 12,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        Positioned(
                          left: 10,
                          child: Text(
                            '${matchups[index].leftUserVotes.toInt()}',
                            style: textTheme(context).labelSmall?.copyWith(
                                fontSize: 7,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0,
                                color: colorScheme(context).onPrimary),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          child: Text(
                            '${matchups[index].rightUserVotes.toInt()}',
                            style: textTheme(context).labelSmall?.copyWith(
                                fontSize: 7,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0,
                                color: colorScheme(context).onPrimary),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.7, size.height);
    path.lineTo(size.width * 0.9, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
