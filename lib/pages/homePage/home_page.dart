import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/repositories/auth_http_repo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            onPressed: () {
              Provider.of<AuthHttpRepo>(context, listen: false).signOut();
            },
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
