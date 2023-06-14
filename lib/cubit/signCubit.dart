import 'package:flutter_bloc/flutter_bloc.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(InitialSignState());

  void selectGender() {
    emit(GenderSelectedSignState());
  }

  void selectPosition() {
    emit(PositionSelectedSignState());
  }

  void selectFamilyType() {
    emit(FamilyTypeSelectedSignState());
  }

  void signUpPage() {
    emit(SignUpState());
  }

  void signInPage() {
    emit(SignInState());
  }
}

class SignState {}

class InitialSignState extends SignState {}

class ChangeSignModeSignState extends SignState {}

class SignUpState extends ChangeSignModeSignState {}

class SignInState extends ChangeSignModeSignState {}

class GenderSelectedSignState extends SignState {}

class PositionSelectedSignState extends SignState {}

class FamilyTypeSelectedSignState extends SignState {}
