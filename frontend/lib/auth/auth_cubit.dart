import 'dart:convert';
import 'package:campus_connect_frontend/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState()) {
    FirebaseAuth.instance.authStateChanges().listen((User? currentUser) {
      if (currentUser == null) {
        emit(SigninState());
      }

      if (currentUser != null) {
        emit(AuthenticatedState());
      }
    });
  }

  Future<void> login(String? email, String? password) async {
    const String apiUrl = "http://10.0.2.2:8000/auth/checkUserExists";

    try {
      if (email == null ||
          email.isEmpty ||
          password == null ||
          password.isEmpty) {
        return signinErrorMessageChanged("Please fill all fields");
      }

      String additn = "$apiUrl?email=$email";
      final response = await http.get(Uri.parse(additn));

      debugPrint(response.statusCode.toString());

      if (response.statusCode == 422 || response.statusCode == 404) {
        Map<String, dynamic> map = jsonDecode(response.body);
        debugPrint(map['message']);
        signinErrorMessageChanged(map['message']);
      }

      if (response.statusCode == 200) {
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          emit(AuthenticatedState());
        } on FirebaseAuthException catch (authError) {
          if (authError.code == 'invalid-credential') {
            signinErrorMessageChanged("Invalid credentials!! Please try again");
          } else {
            signinErrorMessageChanged(
                "Some error encounterred. Please try again");
          }
        }
      }
    } catch (err) {
      signinErrorMessageChanged("Some error encounterred. Please try again");
    }
  }

  Future<void> signup(String? name, String? email, String? password,
      String? confirmPassword) async {
    try {
      if (name == null || name.isEmpty) {
        return signupErrorMessageChanged("Please enter a valid name");
      }

      if (email == null || email.isEmpty) {
        return signupErrorMessageChanged("Please enter a valid email");
      }

      if (confirmPassword == null || confirmPassword.isEmpty) {
        return signupErrorMessageChanged(
            "Please enter a valid confirm password");
      }

      if (password == null || password.isEmpty) {
        return signupErrorMessageChanged("Please enter a valid password");
      }

      if (password != confirmPassword) {
        return signupErrorMessageChanged("Passwords do not match");
      }

      if (!passwordMatch(password)) {
        return signupErrorMessageChanged(
            "The password should contain atleast 6 letters, 2 digits and 1 symbol");
      }

      const signUpApi = "http://10.0.2.2:8000/auth/signUpMember";
      Map<String, dynamic> body = {
        "name": name,
        "email": email,
      };

      final response = await http.post(Uri.parse(signUpApi),
          body: jsonEncode(body),
          headers: {"Content-type": "application/json"});

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 409 || response.statusCode == 422) {
        emit((state as SignupState)
            .copyWith(errorMessage: responseBody['message']));
      } else {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
        emit(AuthenticatedState());
      }
    } catch (err) {
      signupErrorMessageChanged(err.toString());
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    emit(SigninState());
  }

  void returnSignup() {
    emit(SignupState());
  }

  void returnSignin() {
    emit(SigninState());
  }

  bool passwordMatch(String password) {
    final regex = RegExp(
        r'^(?=(.*[0-9]){2,})(?=(.*[a-zA-Z]){6,})(?=.*[!@#$%^&*(),.?":{}|<>]).{9,}$');
    return regex.hasMatch(password);
  }

  void signinErrorMessageChanged(String errorMessage) {
    emit((state as SigninState).copyWith(errorMessage: errorMessage));
  }

  void signinEmailChanged(String email) {
    emit((state as SigninState).copyWith(email: email));
  }

  void signinPasswordChanged(String password) {
    emit((state as SigninState).copyWith(password: password));
  }

  void signupErrorMessageChanged(String errorMessage) {
    emit((state as SignupState).copyWith(errorMessage: errorMessage));
  }

  void signInPasswordVisibilityChanged() {
    bool value = (state as SigninState).isPasswordVisible ?? false;
    emit((state as SigninState).copyWith(isPasswordVisible: !value));
  }

  void signupPasswordVisibilityChanged() {
    bool value = (state as SignupState).isPasswordVisible ?? false;
    emit((state as SignupState).copyWith(isPasswordVisible: !value));
  }

  void signupConfirmPasswordVisibilityChanged() {
    bool value = (state as SignupState).isConfirmPasswordVisible ?? false;
    emit((state as SignupState).copyWith(isConfirmPasswordVisible: !value));
  }

  void signupEmailChanged(String email) {
    emit((state as SignupState).copyWith(email: email));
  }

  void signupPasswordChanged(String password) {
    emit((state as SignupState).copyWith(password: password));
  }

  void signupNameChanged(String name) {
    emit((state as SignupState).copyWith(name: name));
  }

  void signupConfirmPasswordChanged(String confirmPassword) {
    emit((state as SignupState).copyWith(confirmPassword: confirmPassword));
  }
}
