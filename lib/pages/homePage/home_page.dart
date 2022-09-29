import 'package:flutter/material.dart';

import './contents/body_section.dart';
import './contents/bottom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: const SafeArea(
            child: HomeBodySection(),
          ),
        ),
      ),
      bottomNavigationBar: const HomeBottomAppBar(),
    );
  }
}
