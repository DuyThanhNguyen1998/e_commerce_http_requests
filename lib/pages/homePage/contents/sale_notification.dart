import 'package:flutter/material.dart';

class SaleNotification extends StatelessWidget {
  const SaleNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      color: Colors.lightBlue[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width * 0.9,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'A Summer Suprise',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              'Cashback 20%',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
