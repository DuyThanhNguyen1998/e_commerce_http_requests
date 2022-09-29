import 'package:flutter/material.dart';

class BubbleIcon extends StatelessWidget {
  const BubbleIcon({
    Key? key,
    required this.icon,
    required this.amount,
  }) : super(key: key);

  final IconData icon;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(
              icon,
              color: Colors.grey[600],
            ),
          ),
          Positioned(
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 6,
              child: Text(
                amount.toString(),
                style: const TextStyle(
                  fontSize: 8,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
