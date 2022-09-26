import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  void logOutFn(BuildContext ctx) {
    final auth = Provider.of<AuthProvider>(ctx, listen: false);
    auth.logOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(
          'E-Commerce',
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          IconButton(
            onPressed: () => logOutFn(context),
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.orange[400],
            ),
          ),
        ],
      ),
    );
  }
}
