import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/add_user_to_join_call/pages/add_user_to_join_call.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/audio_live.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/audio_live_count/audio_live_count.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/pages/live_audio_chat_expand.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_end/live_end.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/music_list_hollywood_music/music_list_hollywood_music.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/music_list_select_all/pages/music_list_select_all.dart';
import 'package:flutter_application_zestilive/src/features/auth/pages/login_phone_number_page.dart';
import 'package:flutter_application_zestilive/src/features/auth/pages/otp_page.dart';
import 'package:flutter_application_zestilive/src/features/auth/pages/select_signup_page.dart';
import 'package:flutter_application_zestilive/src/features/balance_top_up/model/transaction_model.dart';
import 'package:flutter_application_zestilive/src/features/balance_top_up/pages/balance_top_up_page.dart';
import 'package:flutter_application_zestilive/src/features/balance_top_up/pages/top_up_success_page.dart';
import 'package:flutter_application_zestilive/src/features/bottom_navigation_bar/pages/bottom_navigation_bar_screen.dart';
import 'package:flutter_application_zestilive/src/features/chat_screen/pages/chats.dart';
import 'package:flutter_application_zestilive/src/features/chat_screen/pages/chatting.dart';
import 'package:flutter_application_zestilive/src/features/chat_screen/pages/discover_friends.dart';
import 'package:flutter_application_zestilive/src/features/create_profile/pages/braod_cast_page.dart';
import 'package:flutter_application_zestilive/src/features/create_profile/pages/create_user_page.dart';
import 'package:flutter_application_zestilive/src/features/create_profile/pages/intrest_selection_page.dart';
import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/auth/pages/set_new_password.dart';
import 'package:flutter_application_zestilive/src/features/ecommerce_feature.dart/new_bottom_nav/pages/new_bottom_nav_page.dart';
import 'package:flutter_application_zestilive/src/features/explore/countries_and_regions_page.dart';
import 'package:flutter_application_zestilive/src/features/explore/detail_country_screen.dart';
import 'package:flutter_application_zestilive/src/features/features_multiguest/page/multi_guest_live/page/multi_guest_live.dart';
import 'package:flutter_application_zestilive/src/features/features_multiguest/page/multi_guest_live/page/multi_guest_video_page.dart';
import 'package:flutter_application_zestilive/src/features/features_multiguest/page/multiguest_create_room/pages/multi_guest_create_room.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/pages/gamer_view.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/pages/mobile_live.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/pages/pc_screen_setup.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/pages/select_games.dart';
import 'package:flutter_application_zestilive/src/features/game_streamer/pages/streamer.dart';
import 'package:flutter_application_zestilive/src/features/get_started/pages/on_boarding.dart';
import 'package:flutter_application_zestilive/src/features/get_started/pages/select_language.dart';
import 'package:flutter_application_zestilive/src/features/get_started/pages/splash_page.dart';
import 'package:flutter_application_zestilive/src/features/group_video_calling/pages/group_video_calling.dart';
import 'package:flutter_application_zestilive/src/features/live_stream_user_view/pages/live_stream_user_view.dart';
import 'package:flutter_application_zestilive/src/features/liveoptions/liveoptions.dart';
import 'package:flutter_application_zestilive/src/features/livestream_selling_ecommerce/pages/live_selling_screen.dart';
import 'package:flutter_application_zestilive/src/features/livestream_selling_ecommerce/pages/product_screen.dart';
import 'package:flutter_application_zestilive/src/features/livestream_selling_ecommerce/pages/productcards_screen.dart';
import 'package:flutter_application_zestilive/src/features/meet_love/pages/home_page.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/pages/help_and_feedback.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/pages/leaderboard_screen.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/pages/my_moments_screen.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/pages/my_profile_screen.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/pages/prefernce_screen.dart';
import 'package:flutter_application_zestilive/src/features/pc_live_userview/pages/pc_steamer_view_page.dart';
import 'package:flutter_application_zestilive/src/features/pc_live_userview/pages/pc_userview_page.dart';
import 'package:flutter_application_zestilive/src/features/pk/pages/pk_match_screen.dart';
import 'package:flutter_application_zestilive/src/features/pk/pages/pk_screen.dart';
import 'package:flutter_application_zestilive/src/features/post_section/pages/moment_screen/pages/add_location/add_location_screen.dart';
import 'package:flutter_application_zestilive/src/features/post_section/pages/moment_screen/pages/comment_screen/page/comment_screen.dart';
import 'package:flutter_application_zestilive/src/features/post_section/pages/moment_screen/pages/moment_page.dart';
import 'package:flutter_application_zestilive/src/features/post_section/pages/moment_screen/pages/new_post/new_post.dart';
import 'package:flutter_application_zestilive/src/features/post_section/pages/moment_screen/pages/report_post/Pages/report_screen.dart';
import 'package:flutter_application_zestilive/src/features/post_section/pages/moment_screen/pages/select_privicy/select_privacy.dart';
import 'package:flutter_application_zestilive/src/features/search/pages/contacts_screen.dart';
import 'package:flutter_application_zestilive/src/features/search/pages/facebook_screen.dart';
import 'package:flutter_application_zestilive/src/features/search/pages/home_search_screen.dart';
import 'package:flutter_application_zestilive/src/features/search/pages/search_screen.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/about_company_screen.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/about_us_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/blocked_list_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/broadcaster_agreement_screen.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/change_password_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/connected_account_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/facebook_link_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/google_link_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/help_us_screen.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/notification_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/phone_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/phone_verification_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/privacy_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/privacy_policy_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/twitter_link_page.dart';
import 'package:flutter_application_zestilive/src/features/settings/pages/user_agreement_screen.dart';
import 'package:flutter_application_zestilive/src/features/settings/settings_page.dart';
import 'package:flutter_application_zestilive/src/features/single_live_stream/pages/single_live_stream_screen.dart';
import 'package:flutter_application_zestilive/src/features/user_view/pages/reel_page.dart';
import 'package:flutter_application_zestilive/src/features/user_view/pages/userview_comment.dart';
import 'package:flutter_application_zestilive/src/features/videolive/pages/single_live_broadcaster.dart';
import 'package:flutter_application_zestilive/src/features/videolive/pages/video_count_screen.dart';
import 'package:flutter_application_zestilive/src/features/videolive/pages/videolive_start_screen.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/pages/camera_preview_screen.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/pages/select_sound_screen.dart';
import 'package:flutter_application_zestilive/src/features/youtube_bottom_sheet/page/youtube_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

import '../features/bank_features/pages/bank_page.dart';
import '../features/bank_features/pages/face_id_screen.dart';
import '../features/bank_features/pages/paman_screen.dart';
import '../features/bank_features/pages/success_screen.dart';
import '../features/bank_features/pages/top_up_screen.dart';
import '../features/bank_features/pages/transfer_page.dart';
import '../features/bank_features/pages/wallet_screen.dart';
import '../features/ecommerce_feature.dart/auth/pages/email_page.dart';
import '../features/ecommerce_feature.dart/auth/pages/enter_phone.dart';
import '../features/ecommerce_feature.dart/auth/pages/forgot_password.dart';
import '../features/ecommerce_feature.dart/auth/pages/signin_page.dart';
import '../features/ecommerce_feature.dart/auth/pages/signup_page.dart';
import '../features/ecommerce_feature.dart/main_pages/pages/main_one_page.dart';
import '../features/ecommerce_feature.dart/new_onboard/pages/new_onboarding.dart';
import '../features/explore/explore_page.dart';
import '../features/features_e_commerce/pages/all_item_detail_page.dart';
import '../features/features_e_commerce/pages/all_item_page.dart';
import '../features/features_e_commerce/pages/cart/my_cart.dart';
import '../features/features_e_commerce/pages/payment/payment_page.dart';
import '../features/my_profile/pages/edit_profile_screen.dart';
import '../features/pay_feature/pages/pay_page_one.dart';
import '../features/pay_feature/pages/pay_page_two.dart';
import '../features/search/pages/qr_screen.dart';
import '../features/single_live_stream/features_e_commerce/pages/payment/debit_topup/pages/job_interview.dart';
import '../features/single_live_stream/features_e_commerce/pages/payment/debit_topup/pages/job_interviewperson/job_interviewperson.dart';
import 'error_route.dart';
import 'route_transition.dart';

class MyAppRouter {
  static final router = GoRouter(


    initialLocation: '/${AppRoute.bottomNavigationBarScreen}',

    // initialLocation: '/${AppRoute.bottomNavigationBarScreen}',
    // initialLocation: '/${AppRoute.bottomNavigationBarScreen}',

    routes: [
      GoRoute(
        name: AppRoute.errorPage,
        path: '/${AppRoute.errorPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ErrorPage(),
        ),
      ),
      //////////////////////Ecommerce Router////////////////////////////
      GoRoute(
        name: AppRoute.jobInterview,
        path: '/${AppRoute.jobInterview}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: JobInterview(),
        ),
      ),
      GoRoute(
        name: AppRoute.jobInterviewPerson,
        path: '/${AppRoute.jobInterviewPerson}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: JobInterviewPerson(),
        ),
      ),
      GoRoute(
        name: AppRoute.allItemPage,
        path: '/${AppRoute.allItemPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: AllItemPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.faceId,
        path: '/${AppRoute.faceId}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: FaceIdScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.wallet,
        path: '/${AppRoute.wallet}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: WalletScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.allItemDetailPage,
        path: '/${AppRoute.allItemDetailPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: AllItemDetailPage(item: items[0]),
        ),
      ),
      GoRoute(
        name: AppRoute.myCart,
        path: '/${AppRoute.myCart}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: MyCartPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.payment,
        path: '/${AppRoute.payment}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: PaymentPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.bank,
        path: '/${AppRoute.bank}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: BankPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.transfer,
        path: '/${AppRoute.transfer}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: TransferPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.paman,
        path: '/${AppRoute.paman}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: PamanScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.success,
        path: '/${AppRoute.success}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: SuccessScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.topUp,
        path: '/${AppRoute.topUp}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: TopUpScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.newOnboardingPage,
        path: '/${AppRoute.newOnboardingPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NewOnboardingPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.newSigninPage,
        path: '/${AppRoute.newSigninPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NewSigninPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.newSignupPage,
        path: '/${AppRoute.newSignupPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NewSignupPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.newForgotPasswordPage,
        path: '/${AppRoute.newForgotPasswordPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NewForgotPasswordPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.newEmailPage,
        path: '/${AppRoute.newEmailPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NewEmailPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.newEnterPhonePage,
        path: '/${AppRoute.newEnterPhonePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NewEnterPhonePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.setNewPasswordPage,
        path: '/${AppRoute.setNewPasswordPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SetNewPasswordPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.newBottomNavPage,
        path: '/${AppRoute.newBottomNavPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NewBottomNavPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.mainOnePage,
        path: '/${AppRoute.mainOnePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const MainOnePage(),
        ),
      ),

      GoRoute(
        name: AppRoute.payPageOne,
        path: '/${AppRoute.payPageOne}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PayPageOne(),
        ),
      ),

      GoRoute(
        name: AppRoute.payPageTwo,
        path: '/${AppRoute.payPageTwo}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PayPageTwo(),
        ),
      ),

      GoRoute(
        name: AppRoute.pcSteamerViewPage,
        path: '/${AppRoute.pcSteamerViewPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PcSteamerViewPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.liveoptions,
        path: '/${AppRoute.liveoptions}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LiveOptionScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.bottomNavigationBarScreen,
        path: '/${AppRoute.bottomNavigationBarScreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const BottomNavigationBarScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.mymomentsscreen,
        path: '/${AppRoute.mymomentsscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: MyMomentsScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.aboutusPage,
        path: '/${AppRoute.aboutusPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AboutUsPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.selectSoundScreen,
        path: '/${AppRoute.selectSoundScreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SelectSoundScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.languageSelectionPage,
        path: '/${AppRoute.languageSelectionPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: LanguageSelectionPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.splashPage,
        path: '/${AppRoute.splashPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.onboardingPage,
        path: '/${AppRoute.onboardingPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const OnboardingPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.selectSignupPage,
        path: '/${AppRoute.selectSignupPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SelectSignupPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.loginPoneNumberPage,
        path: '/${AppRoute.loginPoneNumberPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LoginPhoneNumber(),
        ),
      ),
      GoRoute(
        name: AppRoute.cameraPreviewScreen,
        path: '/${AppRoute.cameraPreviewScreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CameraPreviewScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.otpPage,
        path: '/${AppRoute.otpPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const OtpPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.createUserPage,
        path: '/${AppRoute.createUserPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CreateUserPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.broadcasterPage,
        path: '/${AppRoute.broadcasterPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: BroadcasterPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.interestSelectionPage,
        path: '/${AppRoute.interestSelectionPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const InterestSelectionPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.notificationPage,
        path: '/${AppRoute.notificationPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NotificationPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.phonePage,
        path: '/${AppRoute.phonePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PhonePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.phoneVerificationPage,
        path: '/${AppRoute.phoneVerificationPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PhoneVerificationPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.connectedAccountPage,
        path: '/${AppRoute.connectedAccountPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ConnectedAccountPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.privacyPage,
        path: '/${AppRoute.privacyPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PrivacyPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.blockedListPage,
        path: '/${AppRoute.blockedListPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const BlockedListPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.changePasswordPage,
        path: '/${AppRoute.changePasswordPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ChangePasswordPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.aboutUsPage,
        path: '/${AppRoute.aboutUsPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AboutUsPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.facebookLinkPage,
        path: '/${AppRoute.facebookLinkPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const FacebookLinkPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.twitterLinkPage,
        path: '/${AppRoute.twitterLinkPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const TwitterLinkPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.googleLinkPage,
        path: '/${AppRoute.googleLinkPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const GoogleLinkPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.privacyPolicyPage,
        path: '/${AppRoute.privacyPolicyPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PrivacyPolicyPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.helpUsPage,
        path: '/${AppRoute.helpUsPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const HelpUsScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.aboutOurCompanyPage,
        path: '/${AppRoute.aboutOurCompanyPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AboutCompanyScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.userAgreementPage,
        path: '/${AppRoute.userAgreementPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const UserAgreementScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.broadcasterAgreementPage,
        path: '/${AppRoute.broadcasterAgreementPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const BroadcasterAgreementScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.pkMatchScreen,
        path: '/${AppRoute.pkMatchScreen}/:index',
        pageBuilder: (context, state) {
          final index = int.tryParse(state.pathParameters['index'] ?? '0') ??
              0; // Parse index safely
          return buildPageWithFadeTransition<void>(
            context: context,
            state: state,
            child: PkMatchScreen(
                index: index), // Pass the parsed index to PkMatchScreen
          );
        },
      ),
      GoRoute(
        name: AppRoute.pkScreen,
        path: '/${AppRoute.pkScreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PkScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.singleLiveStreamScreen,
        path: '/${AppRoute.singleLiveStreamScreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SIngleLiveStreamScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.audioLive,
        path: '/${AppRoute.audioLive}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AudioLive(),
        ),
      ),
      GoRoute(
        name: AppRoute.myprofilescreen,
        path: '/${AppRoute.myprofilescreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: MyProfileScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.chatScreen,
        path: '/${AppRoute.chatScreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const Chat(),
        ),
      ),
      GoRoute(
        name: AppRoute.chatting,
        path: '/${AppRoute.chatting}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ChatScreen(),
        ),
      ),
      GoRoute(
          name: AppRoute.liveSellingScreen,
          path: '/${AppRoute.liveSellingScreen}',
          pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
                context: context,
                state: state,
                child: const LiveSellingScreen(),
              )),
      GoRoute(
        name: AppRoute.audioLiveCount,
        path: '/${AppRoute.audioLiveCount}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AudioLiveCount(),
        ),
      ),
      GoRoute(
        name: AppRoute.audioLiveChatExpand,
        path: '/${AppRoute.audioLiveChatExpand}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LiveAudioChatExpand(),
        ),
      ),
      GoRoute(
        name: AppRoute.productPage,
        path: '/${AppRoute.productPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ProductPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.productCardScreen,
        path: '/${AppRoute.productCardScreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: ProductGridScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.musicListSelectall,
        path: '/${AppRoute.musicListSelectall}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const MusicListSelectAll(),
        ),
      ),
      GoRoute(
        name: AppRoute.musicListHollywoodmusic,
        path: '/${AppRoute.musicListHollywoodmusic}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const MusicListHollyWoodMusic(),
        ),
      ),
      GoRoute(
        name: AppRoute.liveEnd,
        path: '/${AppRoute.liveEnd}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LiveEnd(),
        ),
      ),
      GoRoute(
        name: AppRoute.userView,
        path: '/${AppRoute.userView}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LiveStreamUserView(),
        ),
      ),
      // GoRoute(
      //   name: AppRoute.joinaudio,
      //   path: '/${AppRoute.joinaudio}',
      //   pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
      //     context: context,
      //     state: state,
      //     child: const LiveAudioChatJoin(),
      //   ),
      // ),
      GoRoute(
        name: AppRoute.streamuserview,
        path: '/${AppRoute.streamuserview}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LiveStreamUserView(),
        ),
      ),
      GoRoute(
        name: AppRoute.qrscreen,
        path: '/${AppRoute.qrscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: QRScannerPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.homesearchscreen,
        path: '/${AppRoute.homesearchscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const HomeSearchScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.searchscreen,
        path: '/${AppRoute.searchscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SearchScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.invitefacebookscreen,
        path: '/${AppRoute.invitefacebookscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const FacebookScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.settingsscreen,
        path: '/${AppRoute.settingsscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SettingsPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.invitecontactsscreen,
        path: '/${AppRoute.invitecontactsscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ContactScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.editprofilescreen,
        path: '/${AppRoute.editprofilescreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const EditProfileScreen()),
      ),
      GoRoute(
        name: AppRoute.preferencescreen,
        path: '/${AppRoute.preferencescreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const PreferenceScreen()),
      ),
      // GoRoute(
      //   name: AppRoute.addeducationscreen,
      //   path: '/${AppRoute.addeducationscreen}',
      //   builder: (context, state) {
      //     final entryIndex =
      //         int.tryParse(state.pathParameters['entryIndex'] ?? '');
      //     return EducationScreen(entryIndex: entryIndex);
      //   },
      // ),
      // GoRoute(
      //   name: AppRoute.careerscreen,
      //   path: '/${AppRoute.careerscreen}',
      //   builder: (context, state) {
      //     final entryIndex =
      //         int.tryParse(state.pathParameters['entryIndex'] ?? '');
      //     return CareerScreen(entryIndex: entryIndex);
      //   },
      // ),
      GoRoute(
        name: AppRoute.discoverfriendsscreen,
        path: '/${AppRoute.discoverfriendsscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context,
            state: state,
            child: const DiscoverFriendsScreen()),
      ),
      GoRoute(
        name: AppRoute.helpandfeedbackscreen,
        path: '/${AppRoute.helpandfeedbackscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const HelpFeedbackScreen()),
      ),
      GoRoute(
        name: AppRoute.countryselectionscreen,
        path: '/${AppRoute.countryselectionscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context,
            state: state,
            child: const CountrySelectionPage()),
      ),
      GoRoute(
        name: AppRoute.explore,
        path: '/${AppRoute.explore}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ExplorePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.detailcountryscreen,
        path: '/${AppRoute.detailcountryscreen}/:countryName',
        pageBuilder: (context, state) {
          final countryName = state.pathParameters['countryName']!;
          return buildPageWithFadeTransition<void>(
            context: context,
            state: state,
            child: DetailCountryScreen(countryName: countryName),
          );
        },
      ),

      /////////////////////////////////
      //MultiGuestCreateRoom
      GoRoute(
        name: AppRoute.createRoom,
        path: '/${AppRoute.createRoom}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context,
            state: state,
            child: const MultiGuestCreateRoom()),
      ),
      GoRoute(
        name: AppRoute.momentscreen,
        path: '/${AppRoute.momentscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const MomentPage()),
      ),
      GoRoute(
          name: AppRoute.post,
          path: '/${AppRoute.post}',
          pageBuilder: (context, state) {
            final String? imagePath = state.uri.queryParameters['image'];
            return buildPageWithFadeTransition<void>(
                context: context,
                state: state,
                child: NewPostScreen(image: imagePath));
          }),
      GoRoute(
          name: AppRoute.privacyscreen,
          path: '/${AppRoute.privacyscreen}',
          pageBuilder: (context, state) {
            final String initialPrivacy = state.extra as String? ?? 'Public';
            return buildPageWithFadeTransition<void>(
                context: context,
                state: state,
                child: SelectPrivacy(
                  initialPrivacy: initialPrivacy,
                ));
          }),
      GoRoute(
        name: AppRoute.locationscreen,
        path: '/${AppRoute.locationscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const AddLocationScreen()),
      ),
      GoRoute(
        name: AppRoute.commentpage,
        path: '/${AppRoute.commentpage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const CommentScreen()),
      ),
      GoRoute(
        name: AppRoute.reportpage,
        path: '/${AppRoute.reportpage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const ReportScreen()),
      ),

      GoRoute(
        name: AppRoute.mobileLivePage,
        path: '/${AppRoute.mobileLivePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const MobileLivePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.selectGamesPage,
        path: '/${AppRoute.selectGamesPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SelectGamesPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.leaderboardscreen,
        path: '/${AppRoute.leaderboardscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LeaderboardScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.videolivestartscreen,
        path: '/${AppRoute.videolivestartscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context,
            state: state,
            child: const VideoLiveStartScreen()),
      ),
      GoRoute(
        name: AppRoute.videolivecountscreen,
        path: '/${AppRoute.videolivecountscreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context,
            state: state,
            child: const VideoLiveCountScreen()),
      ),
      GoRoute(
        name: AppRoute.youtubeBottomSheet,
        path: '/${AppRoute.youtubeBottomSheet}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: YoutubeBottomSheet()),
      ),
      GoRoute(
        name: AppRoute.meetUpHomePage,
        path: '/${AppRoute.meetUpHomePage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const MeetUpHomePage()),
      ),
      GoRoute(
        name: AppRoute.singlelivebroadcaster,
        path: '/${AppRoute.singlelivebroadcaster}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context,
            state: state,
            child: const SingleLiveBroadcaster()),
      ),
      GoRoute(
        name: AppRoute.gamerViewPage,
        path: '/${AppRoute.gamerViewPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const GamerViewPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.streamerPage,
        path: '/${AppRoute.streamerPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const StreamerPage()),
      ),

      GoRoute(
        name: AppRoute.userViewCommentPage,
        path: '/${AppRoute.userViewCommentPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const UserViewCommentPage()),
      ),

      GoRoute(
        name: AppRoute.reelPage,
        path: '/${AppRoute.reelPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const ReelPage()),
      ),
      GoRoute(
        name: AppRoute.multiGuestLive,
        path: '/${AppRoute.multiGuestLive}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const MultiGuestLive()),
      ),
      GoRoute(
        name: AppRoute.multiGuestVideo,
        path: '/${AppRoute.multiGuestVideo}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const MultiGuestVideoPage()),
      ),

      GoRoute(
        name: AppRoute.pcUserviewPage,
        path: '/${AppRoute.pcUserviewPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const PcUserviewPage()),
      ),

      GoRoute(
        name: AppRoute.pcScreenSetupPage,
        path: '/${AppRoute.pcScreenSetupPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const PcScreenSetupPage()),
      ),
      GoRoute(
        name: AppRoute.groupVideoCallingPage,
        path: '/${AppRoute.groupVideoCallingPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const GroupVideoCalling()),
      ),
      GoRoute(
        name: AppRoute.addUserToJoinCallPage,
        path: '/${AppRoute.addUserToJoinCallPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
            context: context, state: state, child: const AddUserToJoinCall()),
      ),

      ///     [Balance Top Up]
      GoRoute(
        name: AppRoute.balanceTopUpPage,
        path: '/${AppRoute.balanceTopUpPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const BalanceTopUpPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.topUpSuccessPage,
        path: '/${AppRoute.topUpSuccessPage}',
        pageBuilder: (context, state) {
          final transaction = state.extra as Transaction;
          return buildPageWithFadeTransition<void>(
            context: context,
            state: state,
            child: TopUpSuccessPage(transaction: transaction),
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );

  static void clearAndNavigate(BuildContext context, String name) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacementNamed(name);
  }
}

class AppRoute {
  static const String errorPage = 'error-page';
  ///Ecommerce Section
  ///jobInterview
  static const jobInterview = 'jobInterview-screen';
  static const jobInterviewPerson = 'jobInterviewPerson-screen';

  static const allItemPage = 'allItemPage-screen';
  static const allItemDetailPage = 'allItemDetailPage-screen';
  static const myCart = 'myCart-screen';
  static const payment = 'payment-screen';
  static const bank = 'BankPage-screen';
  static const transfer = 'transfer-screen';
  static const paman = 'paman-screen';
  static const wallet = 'wallet-screen';
  static const topUp = 'topUp-screen';
  ///MultiGuestCreateRoom
  static const createRoom = 'createRoom-screen';
  static const multiGuestLive = 'multiGuestLive-screen';
  static const exploreDetailScreen = 'exploreDetail-screen';
  static const multiGuestVideo = "multiGuestVideo-screen";
  static const success = "success-screen";
  static const faceId = "faceId-screen";

  static const selectSoundScreen = 'select-sound-screen';
  static const bottomNavigationBarScreen = 'bottom-navigation-bar-screen';
  static const languageSelectionPage = 'language_selection_page';
  static const splashPage = 'splashPage';
  static const myprofilescreen = 'my-profile-screen';
  static const onboardingPage = 'onboarding_page';
  static const selectSignupPage = 'select_signup_page';
  static const loginPoneNumberPage = 'login_pone_number_page';
  static const otpPage = 'otp_page';
  static const explore = 'explore-screen';

  static const createUserPage = 'create_user_page';
  static const broadcasterPage = 'broadcaster_page';
  static const homesearchscreen = 'homesearch_screen';
  static const aboutusPage = 'aboutUsPage';
  static const interestSelectionPage = 'interest_selection_page';
  static const cameraPreviewScreen = 'camera-preview-screen';
  static const notificationPage = 'notificationPage';
  static const connectedAccountPage = 'connected-account-page';
  static const phonePage = 'phone-page';
  static const phoneVerificationPage = 'phone-verification-page';
  static const privacyPage = 'privacy-page';
  static const blockedListPage = 'blocked-list-page';
  static const aboutUsPage = 'about-us-page';
  static const changePasswordPage = 'change-password-page';
  static const facebookLinkPage = 'facebook-link-page';
  static const twitterLinkPage = 'twitter-link-page';
  static const googleLinkPage = 'google-link-page';
  static const privacyPolicyPage = 'privacy-policy-page';
  static const userAgreementPage = 'user-agreement-page';
  static const broadcasterAgreementPage = 'broadcaster-agreement-page';
  static const aboutOurCompanyPage = 'about-our-company-page';
  static const helpUsPage = 'help-us-page';
  static const pkMatchScreen = 'pk-match-screen';
  static const pkScreen = 'pk-screen';
  static const singleLiveStreamScreen = 'single-live-stream-screen';
  static const audioLive = 'audio_live';
  static const chatScreen = 'chat-screen';
  static const chatting = 'chatting';
  static const liveSellingScreen = 'Live-selling-ecommerce';
  static const audioLiveCount = 'audio-live-count';
  static const audioLiveChatExpand = 'live-audio-chat-expanded';
  static const productPage = 'product-page';
  static const productCardScreen = 'product-card-screen';
  static const musicListSelectall = 'music-list-select-all';
  static const musicListHollywoodmusic = 'music-list-hollywood-music';
  static const liveEnd = 'live-end';
  static const userView = 'live-stream-user-view';
  static const joinaudio = 'live-audio-chat-join';
  static const liveoptions = 'live-options';
  static const streamuserview = 'stream-userview';
  static const qrscreen = 'qr-screen';
  static const searchscreen = 'search-screen';
  static const invitefacebookscreen = 'invitefacebook-screen';
  static const invitecontactsscreen = 'invitecontacts-screen';
  static const abcscreen = 'abc-screen';
  static const mymomentsscreen = 'my-moments-screen';
  static const settingsscreen = 'settings-screen';
  static const editprofilescreen = 'edit-profile-screen';
  static const preferencescreen = 'preference-screen';
  static const addeducationscreen = 'add-education-screen';
  static const careerscreen = 'career-screen';
  static const leaderboardscreen = 'leaderboard-screen';
  static const momentscreen = 'moment-screen';
  static const post = 'new-post';
  static const privacyscreen = 'select-privicy';
  static const locationscreen = 'add-location';
  static const commentpage = 'comment-screen';
  static const reportpage = 'report-post';
  static const discoverfriendsscreen = 'discover-friends-screen';
  static const helpandfeedbackscreen = 'help-and-feedback-screen';
  static const explorescreen = 'explore-screen';
  static const detailcountryscreen = 'detail-country-screen';
  static const countryselectionscreen = 'country-selection-screen';
  static const giftUserOneVsOnePage = 'gift-User-One-Vs-One-Page';
  static const mobileLivePage = 'mobile-live-page';
  static const selectGamesPage = 'select-games-page';
  static const gamerViewPage = 'gamer-view-page';
  static const streamerPage = 'streamer-page';
  static const userViewCommentPage = 'user-view-comment-page';
  static const reelPage = 'reel-page';
  static const pcScreenSetupPage = 'pc-screen-setup-page';

  static const pcUserviewPage = 'pc-Uservie-wage';
  static const videolivestartscreen = 'video-live-start-screen';
  static const singlelivebroadcaster = 'single-live-broadcaster';
  static const videolivecountscreen = 'video-live-count-screen';
  static const youtubeBottomSheet = 'youtubeBottomSheet';
  static const pcSteamerViewPage = 'pcSteamerViewPage';
  static const meetUpHomePage = 'meetUpHomePage';
  static const groupVideoCallingPage = 'group-video-calling-page';
  static const addUserToJoinCallPage = 'add-user-to-join-call-page';
  // static const pcSteamerViewPage = 'pc steamer-view-page';

  // Mishal Ecommerrce Onboarding
  static const newOnboardingPage = 'new-onboarding-page';
  static const newSigninPage = 'new-signin-page';
  static const newSignupPage = 'new-sign-up-page';
  static const newForgotPasswordPage = 'new-forgot-password-page';
  static const newEmailPage = 'new-email-page';
  static const newEnterPhonePage = 'new-enter-phone-page';

  static const setNewPasswordPage = 'set-new-password-page';

  static const mainOnePage = 'main-one-page';
  static const newBottomNavPage = 'new-bottom-nav-page';

  static const payPageOne = 'pay-page-one';
  static const payPageTwo = 'pay-page-two';

  ///          [BALANCE TOP UP]
  static const balanceTopUpPage = 'balance_top_up_page';
  static const topUpSuccessPage = 'top_up_success_page';
}
