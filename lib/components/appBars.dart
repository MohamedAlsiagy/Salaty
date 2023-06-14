import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salaty/cubit/signCubit.dart';
import 'package:salaty/pages/signPages/signInPage.dart';
import '../functions/navigation.dart';
import '../pages/mainPage.dart';
import '../pages/signPages/SignUpPage.dart';
import '../shared constants/shared colors.dart';
import 'Buttons.dart';

class SignAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const SignAppBar({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicAppBar(
      leading: NeumorphicIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onPressed: () {
            pop(context);
          },
          depth: -5),
      title: Hero(
        tag: "Salaty",
        child: Text(
          "Salaty",
          style: TextStyle(
              color: mainColor,
              fontFamily: "Sketsa",
              letterSpacing: 2,
              fontSize: 45),
        ),
      ),
      actions: [
        BlocBuilder<SignCubit, SignState>(
          buildWhen: (previous, current) => current is ChangeSignModeSignState,
          builder: (context, state) {
            return NeumorphicIconButton(
                disableDepth: (context.read<SignCubit>().state is SignUpState),
                icon: FontAwesomeIcons.userPlus,
                onPressed: () {
                  tabController.index = 0;
                  context.read<SignCubit>().signUpPage();
                });
          },
        ),
        BlocBuilder<SignCubit, SignState>(
          buildWhen: (previous, current) => current is ChangeSignModeSignState,
          builder: (context, state) {
            return NeumorphicIconButton(
                disableDepth: (context.read<SignCubit>().state is SignInState),
                icon: FontAwesomeIcons.rightToBracket,
                onPressed: () {
                  tabController.index = 1;
                  context.read<SignCubit>().signInPage();
                });
          },
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16 * 2);
}
