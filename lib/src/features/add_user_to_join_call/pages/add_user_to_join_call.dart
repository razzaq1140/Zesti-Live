import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/add_user_to_join_call/provider/add_user_to_join_call_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddUserToJoinCall extends StatefulWidget {
  const AddUserToJoinCall({super.key});

  @override
  State<AddUserToJoinCall> createState() => _AddUserToJoinCallState();
}

class _AddUserToJoinCallState extends State<AddUserToJoinCall> {
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {}); // UI ko update karega
    });
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      appBar: AppBar(
        title: Text('Add User to Join Call',style: textTheme(context).titleSmall?.copyWith(fontWeight: FontWeight.w600,letterSpacing: 0),),
        leading: GestureDetector(
          onTap: (){
            context.pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: colorScheme(context).onPrimary,
              child: Icon(Icons.arrow_back,color: colorScheme(context).secondary,),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: CustomTextFormField(
                  controller: searchController,
                  prefixIcon: Icon(CupertinoIcons.search,color: AppColor.textColor,),
                  fillColor: colorScheme(context).onPrimary,
                  filled: true,
                  borderRadius: 30,
                  hint: 'Search contact...',
                  hintSize: 14,
                  hintColor: AppColor.textColor,
                ),
              ),
              Consumer<AddUserJoinCallProvider>(builder: (context, provider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.addUserToJoinCallList.length,
                  itemBuilder: (context, index) {
                    final data = provider.addUserToJoinCallList[index];
                    if(searchController.text.isEmpty){
                      return GestureDetector(
                        onTap: (){
                          provider.toggleSelection(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorScheme(context).onPrimary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(26),
                                  topRight: Radius.circular(26)
                              )
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundColor: AppColor.greyText.withOpacity(0.3),
                                      backgroundImage: CachedNetworkImageProvider(AppNetworkImages.profile),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Visibility(
                                        visible: data.isOnline,
                                        child: CircleAvatar(
                                          radius: 5,
                                          backgroundColor: AppColor.appGreen,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(data.name),
                                trailing:  data.isSelected
                                    ? Icon(Icons.done, color: AppColor.appGreen)
                                    : null,
                              ),
                              Divider(
                                color: index == 9 ? colorScheme(context).onPrimary : AppColor.greyText.withOpacity(0.1),
                              ),
                            ],
                          ),
                        ),
                      );
                    }else if(data.name.toLowerCase().contains(searchController.text.toLowerCase())){
                      return GestureDetector(
                        onTap: (){
                          provider.toggleSelection(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorScheme(context).onPrimary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(26),
                                  topRight: Radius.circular(26)
                              )
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundColor: AppColor.greyText.withOpacity(0.3),
                                      backgroundImage: CachedNetworkImageProvider(AppNetworkImages.profile),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Visibility(
                                        visible: data.isOnline,
                                        child: CircleAvatar(
                                          radius: 5,
                                          backgroundColor: AppColor.appGreen,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(data.name),
                                trailing:  data.isSelected
                                    ? Icon(Icons.done, color: AppColor.appGreen)
                                    : null,
                              ),
                              Divider(
                                color: index == 9 ? colorScheme(context).onPrimary : AppColor.greyText.withOpacity(0.1),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    else{
                      return Container();
                    }
                  },);
              },),
              SizedBox(height: 12,),
              CustomButton(
                  backgroundColor: AppColor.buttonColor,
                  buttonText: 'Add to Video Call', onPressed: (){
                    context.pop();
              })
            ],
          ),
        ),
      ),
    );
  }
}
