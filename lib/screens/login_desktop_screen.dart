import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:web_rive_tutorial/components/custom_text_field_desktop.dart';
import 'package:web_rive_tutorial/constants/colors.dart';

class LoginDesktopScreen extends StatefulWidget {
  const LoginDesktopScreen({super.key});

  @override
  State<LoginDesktopScreen> createState() => _LoginDesktopScreenState();
}

class _LoginDesktopScreenState extends State<LoginDesktopScreen> {
  /// text editing controller
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailAddressController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();

  /// Rive controller and input
  StateMachineController? controller;
  SMIInput<bool>? mousein;
  SMIInput<bool>? click;

  /// Boolean to track password visibility
  bool isPasswordVisible = false;

  @override
  void initState() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);

    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    // TODO: implement dispose
    super.dispose();
  }

  void emailFocus() {
    click?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    click?.change(passwordFocusNode.hasFocus);

    /// Show password if the field is focused
    if (passwordFocusNode.hasFocus) {
      setState(() {
        isPasswordVisible = true;
      });
    } else {
      setState(() {
        isPasswordVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 30,
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 3,
              // Adjust the flex value based on how much space you want the first widget to take
              child: MouseRegion(
                onEnter: (_) {
                  mousein?.change(true);
                },
                onExit: (_) {
                  mousein?.change(false);
                },
                child: Container(
                  height: 840,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: RiveAnimation.asset(
                      "assets/riv/monster_jump_test.riv",
                      fit: BoxFit.contain,
                      onInit: (artBoard) {
                        controller = StateMachineController.fromArtboard(
                          artBoard,
                          "State Machine 1",
                        );

                        if (controller == null) return;

                        artBoard.addController(controller!);
                        mousein = controller?.findInput("mousein");
                        click = controller?.findInput("click");
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "Create an account",
                    style: GoogleFonts.poppins(
                      color: AppColors.textTitleColor,
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF8A8993),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Log in",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFB298FA),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xFFB298FA),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  /// email address field
                  CustomTextFieldDesktop(
                    focusNode: emailFocusNode,
                    controller: emailAddressController,
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 34,
                  ),

                  /// password text field
                  CustomTextFieldDesktop(
                    focusNode: passwordFocusNode,
                    controller: passwordController,
                    hintText: "Enter your password",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isPasswordVisible,
                    iconButton: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  /// create account btn
                  InkWell(
                    onTap: () {
                      // Trigger the jump animation
                      if (click != null) {
                        click!.change(true);

                        // Optionally reset the click to false if the animation requires it
                        Future.delayed(const Duration(milliseconds: 100), () {
                          click!.change(false);
                        });
                      }
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF6F55B5),
                      ),
                      child: Center(
                        child: Text(
                          "Create account",
                          style: GoogleFonts.poppins(
                            color: AppColors.textTitleColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),

                  /// or register with
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          height: 1,
                          color: Color(0xFF8A8993),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Or register with",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF8A8993),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Expanded(
                        child: Divider(
                          height: 1,
                          color: Color(0xFF8A8993),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 34,
                  ),

                  Row(
                    children: [
                      /// google btn
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 54,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: const Color(0xFF8A8993),
                                width: 1.2,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/svg/google-icon.svg",
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Google",
                                    style: GoogleFonts.poppins(
                                      color: AppColors.textTitleColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 22,
                      ),

                      /// apple btn
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 54,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: const Color(0xFF8A8993),
                                width: 1.2,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/svg/apple-icon.svg",
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Apple",
                                    style: GoogleFonts.poppins(
                                      color: AppColors.textTitleColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
