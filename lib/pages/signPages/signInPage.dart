import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salaty/components/Buttons.dart';
import 'package:salaty/components/form.dart';
import 'package:salaty/functions/navigation.dart';
import 'package:salaty/pages/mainPage.dart';
import 'package:salaty/shared%20constants/shared%20colors.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../../components/appBars.dart';
import '../../cubit/signCubit.dart';

class SignInPage extends StatelessWidget {
  void Function() goToOtherPage;

  SignInPage({Key? key, required this.goToOtherPage}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign in",
                    style: TextStyle(
                        color: mainColor,
                        fontFamily: "Mubarok",
                        letterSpacing: 2,
                        fontSize: 100),
                  ),
                  const SizedBox(height: 30),
                  EmailAndPassWordForm(
                      emailController: emailController,
                      passController: passController),
                  const SizedBox(height: 30),
                  TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => mainColor.withOpacity(0.05)),
                      ),
                      onPressed: () {
                        goToOtherPage();
                        context.read<SignCubit>().signUpPage();
                      },
                      child: Text(
                        "Don't have an account yet? sign up",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ))
                  // TextButton(onPressed: (){pushAndRemoveUntil(context, )}, child: child)
                ],
              )),
        ),
      ),
    );
  }
}
