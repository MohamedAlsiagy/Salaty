import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salaty/components/Buttons.dart';
import 'package:salaty/components/form.dart';
import 'package:salaty/cubit/signCubit.dart';
import 'package:salaty/functions/navigation.dart';
import 'package:salaty/pages/mainPage.dart';
import 'package:salaty/pages/signPages/signInPage.dart';
import 'package:salaty/shared%20constants/shared%20colors.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../../components/appBars.dart';
import '../../shared constants/shared font styles.dart';

class SignUpPage extends StatelessWidget {
  final void Function() goToOtherPage;

  SignUpPage({Key? key, required this.goToOtherPage}) : super(key: key);

  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  int selectedGender = 1;
  int selectedPosition = 1;
  int selectedFamilyType = 1;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                    "Sign Up",
                    style: styleMubarok,
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: formKey,
                    child: EmailAndPassWordForm(
                      emailController: emailController,
                      passController: passController,
                      emailValidator: (value) =>
                          (value ?? '').isEmpty ? "Email can't be empty" : null,
                      passValidator: (value) => (value ?? '').isEmpty
                          ? "passWord can't be empty"
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: NeumorphicTextField(
                              prefixIcon: const Icon(Icons.person),
                              hintText: "Name",
                              controller: nameController),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: BlocBuilder<SignCubit, SignState>(
                            buildWhen: (previous, current) =>
                                current is GenderSelectedSignState,
                            builder: (context, state) {
                              const List<String> genderList = [
                                "Male",
                                "Female"
                              ]; //TODO: Change to Icons?
                              const List<Color> colorOfGender = [
                                Colors.blue,
                                Colors.pink
                              ];
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  genderList.length,
                                  (index) => Expanded(
                                    flex: genderList[index].length + 12,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: index != 2 - 1 ? 10.0 : 0),
                                      child: CustomizedNeumorphicRadio(
                                        onChanged: (int gender) {
                                          selectedGender = gender;
                                          context
                                              .read<SignCubit>()
                                              .selectGender();
                                        },
                                        radioSelected: selectedGender,
                                        radioVal: genderList[index],
                                        value: index + 1,
                                        color: colorOfGender[index],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 3,
                          child: BlocBuilder<SignCubit, SignState>(
                            buildWhen: (previous, current) =>
                                current is PositionSelectedSignState,
                            builder: (context, state) {
                              const List<String> positionList = [
                                "Child",
                                "Parent"
                              ]; //TODO : good icon to use (Icons.supervised_user_circle_rounded) for parent
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  positionList.length,
                                  (index) => Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: index != 2 - 1 ? 10.0 : 0),
                                      child: CustomizedNeumorphicRadio(
                                        onChanged: (int position) {
                                          selectedPosition = position;
                                          context
                                              .read<SignCubit>()
                                              .selectPosition();
                                        },
                                        radioSelected: selectedPosition,
                                        radioVal: positionList[index],
                                        value: index + 1,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: Neumorphic(
                              style: const NeumorphicStyle(
                                  intensity: 0.8, depth: -5),
                              child: Center(
                                  child: Text(
                                "Id",
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 3,
                          child: BlocBuilder<SignCubit, SignState>(
                            buildWhen: (previous, current) =>
                                current is FamilyTypeSelectedSignState,
                            builder: (context, state) {
                              const List<String> familyTypeList = ["N.F", "E.F"];
                              const List<String> familyTypeListEmphasized = [
                                "New Family",
                                "Existing Family"
                              ];
                              final List<Color> familyTypeColors = [
                                mainColor.complement(),
                                mainColor
                              ];
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  familyTypeList.length,
                                  (index) => Expanded(
                                    flex: index + 1 == selectedFamilyType ? 6 : 3,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: index != 2 - 1 ? 10.0 : 0),
                                      child: CustomizedNeumorphicRadio(
                                        onChanged: (int familyType) {
                                          selectedFamilyType = familyType;
                                          context
                                              .read<SignCubit>()
                                              .selectFamilyType();
                                        },
                                        radioSelected: selectedFamilyType,
                                        radioVal: index + 1 == selectedFamilyType
                                            ? familyTypeListEmphasized[index]
                                            : familyTypeList[index],
                                        value: index + 1,
                                        color: familyTypeColors[index],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: NeumorphicButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (nameController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Name can't be empty",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: mainColor.complement().withOpacity(0.6),
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              }
                              ;
                            },
                            style: NeumorphicStyle(
                                color: mainColor,
                                depth: 12,
                                intensity: 0.7,
                                shape: NeumorphicShape.flat),
                            child: Center(
                                child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "Sign Up",
                                style: styleMubarok.copyWith(
                                    fontSize: 28, color: Colors.white),
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => mainColor.withOpacity(0.05)),
                      ),
                      onPressed: () {
                        goToOtherPage();
                        context.read<SignCubit>().signInPage();
                      },
                      child: Text(
                        "already have an account? sign in",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
