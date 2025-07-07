import 'package:copy_with_extension/copy_with_extension.dart';

part 'auth_state.g.dart';

class AuthState {}

class AuthInitialState extends AuthState {}

@CopyWith()
class SignupState extends AuthState {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? errorMessage;
  bool? isPasswordVisible = false;
  bool? isConfirmPasswordVisible = false;

  SignupState(
      {this.name,
      this.email,
      this.password,
      this.confirmPassword,
      this.errorMessage,
      this.isPasswordVisible,
      this.isConfirmPasswordVisible});
}

@CopyWith()
class SigninState extends AuthState {
  String? email;
  String? password;
  String? errorMessage;
  bool? isPasswordVisible;

  SigninState(
      {this.email, this.password, this.errorMessage, this.isPasswordVisible});
}

class AuthloadingState extends AuthState {}

class AuthenticatedState extends AuthState {}
