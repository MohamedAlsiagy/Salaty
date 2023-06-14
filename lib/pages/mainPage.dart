import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salaty/components/Buttons.dart';
import 'package:salaty/components/form.dart';
import 'package:salaty/pages/signPages/SignUpPage.dart';
import 'package:salaty/pages/signPages/mainSignPage.dart';
import 'package:salaty/pages/signPages/signInPage.dart';
import 'package:salaty/shared%20constants/shared%20colors.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../cubit/signCubit.dart';
import '../functions/navigation.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "Salaty",
                        child: Text(
                          "Salaty",
                          style: TextStyle(
                              color: mainColor,
                              fontFamily: "Sketsa",
                              letterSpacing: 2,
                              fontSize: 80),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            NeumorphicButtonWithIcon(
                              icon: FontAwesomeIcons.rightToBracket,
                              onPressed: () {
                                push(context, const MainSignPage(initialIndex: 1));
                                context.read<SignCubit>().signInPage();
                              },
                              text: "Sign in",
                              size: 18,
                            ),
                            const SizedBox(height: 20),
                            NeumorphicButtonWithIcon(
                              icon: FontAwesomeIcons.userPlus,
                              onPressed: () {
                                push(context, const MainSignPage(initialIndex: 0));
                                context.read<SignCubit>().signUpPage();
                              },
                              text: "Sign Up",
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Developed by ',
                    style: TextStyle(color: mainColor.darken(10), fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Mohammed Elseiagy',
                        style: TextStyle(
                            color: mainColor.darken(10),
                            fontFamily: "Sketsa",
                            fontSize: 26),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
