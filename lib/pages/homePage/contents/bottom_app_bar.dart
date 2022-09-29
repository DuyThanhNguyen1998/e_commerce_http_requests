import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/auth_provider.dart';

class HomeBottomAppBar extends StatefulWidget {
  const HomeBottomAppBar({super.key});

  @override
  State<HomeBottomAppBar> createState() => _HomeBottomAppBarState();
}

class _HomeBottomAppBarState extends State<HomeBottomAppBar> {
  int _currentIndex = 0;

  void _logOutFn(BuildContext ctx) {
    final auth = Provider.of<AuthProvider>(ctx, listen: false);
    auth.logOut();
  }

  Widget _buildNavigateButton(
      int ownIndex, IconData icon, void Function() activateFn) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: activateFn,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: _currentIndex == ownIndex
                  ? Colors.orange[400]
                  : Colors.grey[400],
              size: _currentIndex == ownIndex ? 27 : 25,
            ),
            if (_currentIndex == ownIndex)
              CircleAvatar(
                radius: 2,
                backgroundColor: Colors.orange[400],
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
          top: 0,
          bottom: 8,
          left: 8,
          right: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildNavigateButton(
              0,
              Icons.storefront_outlined,
              () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            _buildNavigateButton(
              1,
              Icons.favorite_border_rounded,
              () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            _buildNavigateButton(
              2,
              Icons.chat_outlined,
              () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            _buildNavigateButton(
              3,
              Icons.logout_rounded,
              () {
                setState(() {
                  _currentIndex = 3;
                });
                _logOutFn(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
