import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:salaty/cubit/signCubit.dart';
import 'package:salaty/pages/mainPage.dart';
import 'package:salaty/pages/signPages/SignUpPage.dart';
import 'package:salaty/pages/signPages/mainSignPage.dart';
import 'package:salaty/shared%20constants/shared%20colors.dart';
import 'package:tinycolor2/tinycolor2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignCubit(),
      child: NeumorphicApp(
        debugShowCheckedModeBanner: false,
        title: 'Salaty',
        themeMode: ThemeMode.light,
        theme: NeumorphicThemeData(
            iconTheme: IconThemeData(
              color: mainColor,
            ),
            baseColor: const Color(0xFFE5D3B3).lighten(18), //Color(0xFFE5D3B3).lighten(18),
            lightSource: LightSource.topLeft,
            depth: 10,
            textTheme: TextTheme(
                bodyLarge: TextStyle(
              color: mainColor.darken(5),
              letterSpacing: 1.1,
            ))),
        darkTheme: const NeumorphicThemeData(
          baseColor: Color(0xFF3E3E3E),
          lightSource: LightSource.topLeft,
          depth: 6,
        ),
        home: MainPage(),
      ),
    );
  }
}
