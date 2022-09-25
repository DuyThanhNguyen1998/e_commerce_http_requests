import 'package:e_commerce_http_requests/pages/homePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/repositories/auth_http_repo.dart';
import '/pages/signInPage/sign_in_page.dart';
import '/pages/signUpPage/sign_up_page.dart';
import '/pages/splashPage/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthHttpRepo(),
      child: Consumer<AuthHttpRepo>(
        builder: (ctx, auth, ch) {
          final authState = auth.checkAuthenticate();
          debugPrint('Auth changed: $authState');

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
            home: authState ? const HomePage() : const SignInPage(),
            routes: {
              SignInPage.routeName: (ctx) => const SignInPage(),
              SignUpPage.routeName: (ctx) => const SignUpPage(),
              SplashPage.routeName: (ctx) => const SplashPage(),
            },
          );
        },
      ),
    );
  }
}
