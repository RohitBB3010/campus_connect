import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/auth/auth_cubit.dart';
import 'package:campus_connect_frontend/auth/auth_state.dart';
import 'package:campus_connect_frontend/components/custom_button.dart';
import 'package:campus_connect_frontend/components/text_field.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();

        if (state is SigninState) {
          return Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/auth_bg.png"),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.35,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: ColorConsts().primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SpacingConsts().mediumHeightBetweenFields(context),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: AutoSizeText(
                                "Connect. Coordinate. Collaborate.",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'MinorkSemiBold',
                                    fontSize: 40,
                                    color: Colors.black.withOpacity(0.8)),
                              ),
                            ),
                            SpacingConsts().smallHeightBetweenFields(context),
                            if (state.errorMessage != null)
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.02,
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.error,
                                        color: Colors.white,
                                      ),
                                      SpacingConsts()
                                          .smallWidthBetweenFields(context),
                                      Expanded(
                                        child: AutoSizeText(
                                          state.errorMessage!,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ),
                                    ],
                                  )),
                            if (state.errorMessage != null)
                              SpacingConsts().smallHeightBetweenFields(context),
                            SpacingConsts().smallHeightBetweenFields(context),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AutoSizeText(
                                    "Email",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: 'Nunito', fontSize: 15),
                                  ),
                                  CustomTextField(
                                      fieldWidth: 0.8,
                                      fieldHeight: 0.07,
                                      prefixIconData: Icons.email,
                                      hintText: "Enter email",
                                      onChanged: authCubit.signinEmailChanged),
                                ],
                              ),
                            ),
                            SpacingConsts().smallHeightBetweenFields(context),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AutoSizeText(
                                    "Password",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: 'Nunito', fontSize: 15),
                                  ),
                                  CustomTextField(
                                      fieldWidth: 0.8,
                                      fieldHeight: 0.07,
                                      prefixIconData: Icons.password,
                                      hintText: "Enter password",
                                      onChanged:
                                          authCubit.signinPasswordChanged),
                                  SpacingConsts()
                                      .smallHeightBetweenFields(context),
                                  CustomButton(context, "Login",
                                      ColorConsts().secondary_orange, () {
                                    authCubit.login(
                                        state.email!, state.password!);
                                  }, 0.8, 0.06, 10)
                                ],
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  authCubit.returnSignup();
                                },
                                child:
                                    const AutoSizeText("New member? Sign up!!"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is AuthenticatedState) {
          return const HomePage();
        }

        return const AutoSizeText("Last resort sign in page");
      },
    );
  }
}
