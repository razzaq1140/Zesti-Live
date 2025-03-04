import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/add_user_to_join_call/provider/add_user_to_join_call_provider.dart';
import 'package:flutter_application_zestilive/src/features/auth/provider/otp_timer_provider.dart';
import 'package:flutter_application_zestilive/src/features/auth/provider/phone_number_provider.dart';
import 'package:flutter_application_zestilive/src/features/balance_top_up/provider/expansion_tile_provider.dart';
import 'package:flutter_application_zestilive/src/features/bottom_navigation_bar/provider/bottom_navigation_bar_provider..dart';
import 'package:flutter_application_zestilive/src/features/create_profile/provider/create_user_page_provider.dart';
import 'package:flutter_application_zestilive/src/features/create_profile/provider/search_lang_provider.dart';
import 'package:flutter_application_zestilive/src/features/create_profile/provider/select_intrest_provider.dart';
import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/new_bottom_nav/provider/botom_nav_provider.dart';
import 'package:flutter_application_zestilive/src/features/features_multiguest/page/multi_guest_live/provider/multi_guest_chat_provider.dart';
import 'package:flutter_application_zestilive/src/features/features_multiguest/page/multi_guest_live/provider/multi_guest_create_room_provider.dart';
import 'package:flutter_application_zestilive/src/features/features_multiguest/page/multi_guest_live/provider/profile_bottom_sheet_provider.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/provider/game_steamer_provider.dart';
import 'package:flutter_application_zestilive/src/features/get_started/provider/lang_selection_provider.dart';
import 'package:flutter_application_zestilive/src/features/get_started/provider/onboarding_provider.dart';
import 'package:flutter_application_zestilive/src/features/gift_user_view/provider/gift_user_provider.dart';
import 'package:flutter_application_zestilive/src/features/home/provider/sound_video_provider.dart';
import 'package:flutter_application_zestilive/src/features/home/provider/video_provider.dart';
import 'package:flutter_application_zestilive/src/features/live_stream_user_view/models/invite_friends_tabar_modal.dart';
import 'package:flutter_application_zestilive/src/features/live_stream_user_view/provider/invitefriendsprovider.dart';
import 'package:flutter_application_zestilive/src/features/livestream_selling_ecommerce/provider/live_selling_provider.dart';
import 'package:flutter_application_zestilive/src/features/meet_love/image_provider/image_provider.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/provider/countryselection_provider.dart';
import 'package:flutter_application_zestilive/src/features/multiguest/provider/followlist_provider.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/data/user_data.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/provider/career_provider.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/provider/edit_profile_provider.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/provider/education_provider.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/provider/profile_controller.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/provider/profile_provider.dart';
import 'package:flutter_application_zestilive/src/features/pk/provider/giftstab_provider.dart';
import 'package:flutter_application_zestilive/src/features/pk/provider/pk_match_screen_provider.dart';
import 'package:flutter_application_zestilive/src/features/search/provider/searchprovider.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/provider/single_live_stream_provider.dart';
import 'package:flutter_application_zestilive/src/features/videolive/provider/tags_selection_provider.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/camera_provider.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/comment_provider.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/favourite_provider.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/following_provider.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/for_you_provider.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/share_provider.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/tab_provider.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/time_selection_peovider.dart';
import 'package:flutter_application_zestilive/src/features/youtube_bottom_sheet/provider/youtube_sheet_provider.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_application_zestilive/src/theme/app_theme.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CareerProvider()),
        ChangeNotifierProvider(create: (context) => EditProfileProvider()),
        ChangeNotifierProvider(create: (_) => EducationProvider()),
        ChangeNotifierProvider(create: (_) => FollowListProvider()),
        ChangeNotifierProvider(create: (_) => CountrySelectionProvider()),
        ChangeNotifierProvider(create: (_) => FollowingProvider()),
        ChangeNotifierProvider(create: (_) => SelectedImageProvider()),
        ChangeNotifierProvider(create: (_) => ForYouProvider()),
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => InterestSelectionProvider()),
        ChangeNotifierProvider(create: (_) => SearchLanguageProvider()),
        ChangeNotifierProvider(create: (_) => CreateUserProvider()),
        ChangeNotifierProvider(create: (_) => CountdownProvider()),
        ChangeNotifierProvider(create: (_) => PhoneNumberProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => LanguageSelectionProvider()),
        ChangeNotifierProvider(create: (_) => LiveSellingProvider()),
        ChangeNotifierProvider(create: (_) => SingleLiveStreamProvider()),
        ChangeNotifierProvider(create: (_) => PkMatchProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => VideoProvider()),
        ChangeNotifierProvider(create: (_) => CommentProvider()),
        ChangeNotifierProvider(create: (_) => ShareProvider()),
        ChangeNotifierProvider(create: (_) => SoundVideoProvider()),
        ChangeNotifierProvider(create: (_) => TimeSelectionProvider()),
        ChangeNotifierProvider(create: (_) => CameraProvider()),
        ChangeNotifierProvider(create: (_) => GiftTabProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ChangeNotifierProvider(create: (_) => GiftUserProvider()),
        ChangeNotifierProvider(create: (_) => ProfileBottomSheetProvider()),
        ChangeNotifierProvider(create: (_) => TagSelectionProvider()),
        ChangeNotifierProvider(create: (_) => YoutubeSheetProvider()),
        ChangeNotifierProvider(create: (_) => MultiGuestCreateRoomProvider()),
        ChangeNotifierProvider(create: (_) => MultiGuestChatProvider()),
        ChangeNotifierProvider(create: (_) => GameSteamerProvider()),
        ChangeNotifierProvider(create: (_) => AddUserJoinCallProvider()),
        ChangeNotifierProvider(create: (_) => NewBottomNavigationBarProvider()),
        ChangeNotifierProvider(
            create: (_) =>
                ProfileController(userProfile: getDefaultUserProfile())),
        ChangeNotifierProvider(
          create: (_) => Invitefriendsprovider(
            recentUsers: inviteRecentUsers,
            friendsUsers: inviteFriendsUsers,
            fansUsers: inviteFansUsers,
          ),
        ),
        ChangeNotifierProvider(create: (_) => ExpansionTileProvider()),
      ],
      child: GlobalLoaderOverlay(
        child: MaterialApp.router(
          title: 'Zesti Live',
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldMessengerKey,
          theme: AppTheme.instance.lightTheme,
          routerDelegate: MyAppRouter.router.routerDelegate,
          routeInformationParser: MyAppRouter.router.routeInformationParser,
          routeInformationProvider: MyAppRouter.router.routeInformationProvider,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
        ),
      ),
    );
  }
}
