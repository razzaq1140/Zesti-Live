import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/search/modal/home_search_modal.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeSearchScreen extends StatelessWidget {
  const HomeSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<User> users = [
      User(
        trailingicon: AppIcons.circleCheck,
        name: 'Jannete King',
        caption: 'creator',
        fans: '12k',
        rating: '4.5',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.circlePlus,
        name: 'Alex Johnson',
        caption: 'knowledge',
        fans: '10k',
        rating: '4.8',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.bothFollow,
        name: 'Emily Davis',
        caption: 'Exploring',
        fans: '8k',
        rating: '4.6',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.circleCheck,
        name: 'Michael Brown',
        caption: 'innovator',
        fans: '5k',
        rating: '4.3',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.circlePlus,
        name: 'Sophia Wilson',
        caption: 'Storyteller',
        fans: '3k',
        rating: '4.7',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.circleCheck,
        name: 'Jannete King',
        caption: 'creator',
        fans: '12k',
        rating: '4.5',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.circlePlus,
        name: 'Alex Johnson',
        caption: 'knowledge',
        fans: '10k',
        rating: '4.8',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.bothFollow,
        name: 'Emily Davis',
        caption: 'Exploring',
        fans: '8k',
        rating: '4.6',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.circleCheck,
        name: 'Michael Brown',
        caption: 'innovator',
        fans: '5k',
        rating: '4.3',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.circlePlus,
        name: 'Sophia Wilson',
        caption: 'Storyteller',
        fans: '3k',
        rating: '4.7',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.circleCheck,
        name: 'Jannete King',
        caption: 'creator',
        fans: '12k',
        rating: '4.5',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.circlePlus,
        name: 'Alex Johnson',
        caption: 'knowledge',
        fans: '10k',
        rating: '4.8',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.bothFollow,
        name: 'Emily Davis',
        caption: 'Exploring',
        fans: '8k',
        rating: '4.6',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.circleCheck,
        name: 'Michael Brown',
        caption: 'innovator',
        fans: '5k',
        rating: '4.3',
        avatarUrl: AppImages.allPopularScreen,
      ),
      User(
        trailingicon: AppIcons.circlePlus,
        name: 'Sophia Wilson',
        caption: 'Storyteller',
        fans: '3k',
        rating: '4.7',
        avatarUrl: AppImages.allPopularScreen,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: colorScheme(context).onPrimary,
          backgroundColor: colorScheme(context).primary,
          title: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: CustomTextFormField(
              readOnly: true,
              hint: 'Search username/ID',
              hintColor: colorScheme(context).onPrimary,
              hintSize: 14,
              prefixIcon: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: colorScheme(context).onPrimary,
                  )),
              suffixIcon: IconButton(
                  onPressed: () {
                    context.pushNamed(AppRoute.searchscreen);
                  },
                  icon: Icon(
                    Icons.search,
                    color: colorScheme(context).onPrimary,
                  )),
              borderRadius: 20,
              fillColor: colorScheme(context).onPrimary.withOpacity(0.4),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () async {
                  final scannedCode =
                      await context.pushNamed(AppRoute.qrscreen);
                  if (scannedCode != null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Scanned Code'),
                        content: Text('${scannedCode}'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  'Scan QR Code',
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                leading: CircleAvatar(
                    radius: 20, child: SvgPicture.asset(AppIcons.qr)),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Discover Friends',
                style: textTheme(context).bodySmall?.copyWith(
                    color: colorScheme(context).onSurface.withOpacity(0.5)),
              ),
              const SizedBox(
                height: 8,
              ),
              ListTile(
                  onTap: () {
                    context.pushNamed(AppRoute.invitefacebookscreen);
                  },
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    'Facebook Friends',
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: AppColor.tagBlue,
                    radius: 20,
                    backgroundImage: const AssetImage(AppImages.facebook),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                  )),
              Divider(
                color: colorScheme(context).outlineVariant,
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                onTap: () {
                  context.pushNamed(AppRoute.invitecontactsscreen);
                },
                leading: CircleAvatar(
                  backgroundColor: AppColor.appGreen,
                  radius: 20,
                  child: SvgPicture.asset(AppIcons.contactsIcon),
                ),
                title: Text(
                  'Contacts',
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'You May Like',
                style: textTheme(context).bodySmall?.copyWith(
                    color: colorScheme(context).onSurface.withOpacity(0.5)),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              foregroundImage:
                                  NetworkImage(users[index].avatarUrl),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 14,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.tagBlue,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: colorScheme(context).surface),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 6,
                                      color: colorScheme(context).onPrimary,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      users[index].rating,
                                      style: textTheme(context)
                                          .labelSmall
                                          ?.copyWith(
                                            fontSize: 8,
                                            color:
                                                colorScheme(context).onPrimary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        title: Text(
                          users[index].name,
                          style: textTheme(context)
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              '${users[index].caption}, Fans: ${users[index].fans}',
                              style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.5)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Chip(
                              visualDensity: const VisualDensity(
                                  vertical: -4, horizontal: 0),
                              backgroundColor: AppColor.tagBlue,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              shape: const StadiumBorder(
                                side: BorderSide(color: Colors.transparent),
                              ),
                              avatar: Icon(
                                Icons.signal_cellular_alt,
                                color: colorScheme(context).onPrimary,
                                size: 14,
                              ),
                              label: Text(
                                'Live',
                                style: textTheme(context).labelSmall?.copyWith(
                                    color: colorScheme(context).onPrimary),
                              ),
                              elevation: 0,
                              avatarBoxConstraints: const BoxConstraints(
                                maxHeight: 12,
                                maxWidth: 12,
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            )
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(users[index].trailingicon)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
