import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/search/provider/searchprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/const/global_variables.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

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
              textStyle: textTheme(context)
                  .bodyMedium
                  ?.copyWith(color: colorScheme(context).onPrimary),
              onChanged: (value) {
                searchProvider.filterUsers(value);
              },
              hint: 'Search username/ID',
              hintColor: colorScheme(context).onPrimary,
              hintSize: 14,
              prefixIcon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: colorScheme(context).onPrimary,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: colorScheme(context).onPrimary,
                ),
              ),
              borderRadius: 20,
              fillColor: colorScheme(context).onPrimary.withOpacity(0.4),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: searchProvider.filteredUsers.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final user = searchProvider.filteredUsers[index];
              return Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          foregroundImage: NetworkImage(user.avatarUrl),
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
                                color: colorScheme(context).surface,
                              ),
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
                                  user.rating,
                                  style: textTheme(context)
                                      .labelSmall
                                      ?.copyWith(
                                        fontSize: 8,
                                        color: colorScheme(context).onPrimary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      user.name,
                      style: textTheme(context)
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(user.trailingicon),
                    ),
                  ),
                  Divider(
                    color: colorScheme(context).outlineVariant,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
