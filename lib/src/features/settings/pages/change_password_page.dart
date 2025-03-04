import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _obscureOldPassword = true;
  bool _obscureNewPassword = true;
  bool _isValidNewPassword = false;

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  void _validateNewPassword() {
    setState(() {
      _isValidNewPassword = _newPasswordController.text.isNotEmpty &&
          _newPasswordController.text.length >= 6 &&
          _newPasswordController.text != _oldPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(98),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.tagRed,
          title: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Text(
              'Change Password',
              style: textTheme(context).titleSmall?.copyWith(
                  color: colorScheme(context).surface,
                  fontWeight: FontWeight.w700),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: colorScheme(context).onPrimary),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _oldPasswordController,
              obscureText: _obscureOldPassword,
              onChanged: (_) => _validateNewPassword(),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: "Old Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureOldPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColor.textGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureOldPassword = !_obscureOldPassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _newPasswordController,
              obscureText: _obscureNewPassword,
              onChanged: (_) => _validateNewPassword(),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: "New Password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureNewPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColor.textGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureNewPassword = !_obscureNewPassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _isValidNewPassword ? () => context.pop() : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isValidNewPassword
                    ? AppColor.tagRed
                    : const Color(0xffE0E0E0),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                "Done",
                style: textTheme(context).bodyLarge?.copyWith(
                      color: _isValidNewPassword
                          ? colorScheme(context).onPrimary
                          : AppColor.textGrey,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
