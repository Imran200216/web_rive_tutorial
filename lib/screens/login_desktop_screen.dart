import 'package:flutter/material.dart';
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
  /// Rive controller and input
  StateMachineController? controller;
  SMIInput<bool>? mousein;
  SMIInput<bool>? click;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MouseRegion(
            onEnter: (_) {
              // Trigger the mouse-in animation when the mouse enters the region
              mousein?.change(true);
            },
            onExit: (_) {
              // Reset the animation when the mouse exits the region
              mousein?.change(false);
            },
            child: SizedBox(
              height: 840,
              width: 840,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    RiveAnimation.asset(
                      "assets/riv/monster_jump_test.riv",
                      fit: BoxFit.contain,
                      onInit: (artBoard) {
                        // Initialize the Rive animation and find the state machine inputs
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
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text("HI"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
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
                  height: 20,
                ),
                const CustomTextFieldDesktop(
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 34,
                ),
                const CustomTextFieldDesktop(
                  hintText: "Enter your password",
                  keyboardType: TextInputType.visiblePassword,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
