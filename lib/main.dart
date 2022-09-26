import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/auth_provider.dart';

import '/pages/homePage/home_page.dart';
import '/pages/authPage/auth_page.dart';
import '/pages/splashPage/splash_page.dart';
import '/pages/forgotPassPage/forgot_pass_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (_, auth, __) {
          final userIsAuth = auth.isAuth();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-Commerce Using Http Requests',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: Colors.white,
                    secondary: Colors.blueGrey,
                  ),
              fontFamily: 'DancingScript',
              textTheme: Theme.of(context).textTheme.copyWith(
                    headline4: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    headline5: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    headline6: const TextStyle(
                      fontSize: 18,
                    ),
                    labelMedium: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    bodyText1: const TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                    bodyText2: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400],
                  elevation: 0,
                ),
              ),
            ),
            home: userIsAuth
                ? const HomePage()
                : FutureBuilder(
                    future: auth.tryAutoLogIn(),
                    builder: (_, loginSnapshot) =>
                        loginSnapshot.connectionState == ConnectionState.waiting
                            ? const SplashPage()
                            : const AuthPage(),
                  ),
            routes: {
              HomePage.routeName: (_) => const HomePage(),
              AuthPage.routeName: (_) => const AuthPage(),
              SplashPage.routeName: (_) => const SplashPage(),
              ForgotPassPage.routeName: (_) => const ForgotPassPage(),
            },
          );
        },
      ),
    );
  }
}
