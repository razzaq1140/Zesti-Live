import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/live_stream_user_view/models/invite_friends_tabar_modal.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../provider/invitefriendsprovider.dart';

class InviteTabbar extends StatelessWidget {
  const InviteTabbar({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Invitefriendsprovider(
        recentUsers: inviteRecentUsers,
        friendsUsers: inviteFriendsUsers,
        fansUsers: inviteFansUsers,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            DefaultTabController(
              length: 3,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: colorScheme(context).primary,
                      labelColor: colorScheme(context).primary,
                      unselectedLabelColor:
                          colorScheme(context).onSurface.withOpacity(0.4),
                      tabs: const [
                        Tab(text: 'Recent'),
                        Tab(text: 'Friends'),
                        Tab(text: 'Fans'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          _FriendsListTab(tabType: 'recent'),
                          _FriendsListTab(tabType: 'friends'),
                          _FriendsListTab(tabType: 'fans'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            _InviteButton(),
          ],
        ),
      ),
    );
  }
}

class _FriendsListTab extends StatelessWidget {
  final String tabType;

  const _FriendsListTab({required this.tabType});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Invitefriendsprovider>(context);

    List<InviteFriendsTabbbarModal> users;
    List<bool> isSelected;
    Function(int) toggleSelection;

    if (tabType == 'recent') {
      users = provider.recentUsers;
      isSelected = provider.isSelectedRecent;
      toggleSelection = provider.toggleSelectionRecent;
    } else if (tabType == 'friends') {
      users = provider.friendsUsers;
      isSelected = provider.isSelectedFriends;
      toggleSelection = provider.toggleSelectionFriends;
    } else {
      users = provider.fansUsers;
      isSelected = provider.isSelectedFans;
      toggleSelection = provider.toggleSelectionFans;
    }

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          ),
          title: Text(user.name),
          subtitle: Text(user.caption),
          trailing: Checkbox(
            side: BorderSide(
                color: colorScheme(context).onSurface.withOpacity(0.5)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
            value: isSelected[index],
            onChanged: (bool? value) {
              toggleSelection(index);
            },
          ),
        );
      },
    );
  }
}

class _InviteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Invitefriendsprovider>(context);
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme(context).onPrimary,
          backgroundColor: colorScheme(context).primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          provider.addSelectedAvatarsToAvatarList();
          context.pop();
        },
        child: Text(
          'Invite (${provider.totalSelectedCount}/100)',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
