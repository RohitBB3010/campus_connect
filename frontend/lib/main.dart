import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/auth/auth_cubit.dart';
import 'package:campus_connect_frontend/auth/auth_state.dart';
import 'package:campus_connect_frontend/auth/pages/signin_page.dart';
import 'package:campus_connect_frontend/auth/pages/signup_page.dart';
import 'package:campus_connect_frontend/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff121212)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthCubit())],
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            debugPrint(state.toString());

            if (state is SigninState) {
              return const SigninPage();
            }

            if (state is SignupState) {
              return const SignupPage();
            }

            if (state is AuthenticatedState) {
              return const HomePage();
            }

            return const AutoSizeText("Rohit");
          },
        ));
  }
}
