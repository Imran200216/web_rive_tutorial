import 'package:flutter/material.dart';
import 'package:web_rive_tutorial/constants/colors.dart';
import 'package:web_rive_tutorial/screens/login_desktop_screen.dart';
import 'package:web_rive_tutorial/screens/login_mobile_screen.dart';
import 'package:web_rive_tutorial/screens/login_tablet_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Media query
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1500,
            ),
            child: Center(
              child: SingleChildScrollView(
                // Enables scrolling if content overflows
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (size.width >= 1100)
                      const LoginDesktopScreen()
                    else if (size.width >= 650 && size.width < 1100)
                      const LoginTabletScreen()
                    else
                      const LoginMobileScreen(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
