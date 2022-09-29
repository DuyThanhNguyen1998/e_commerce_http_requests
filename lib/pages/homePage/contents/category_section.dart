import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
  }) : super(key: key);

  Widget _buildCategory(
    BuildContext context,
    IconData icon,
    String title,
  ) {
    return InkWell(
      onTap: () {
        debugPrint('Category Item');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrange[200],
              ),
              child: Icon(
                icon,
                size: 27,
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategory(
            context,
            Icons.flash_on_rounded,
            'Flash Deal',
          ),
          _buildCategory(
            context,
            Icons.library_books_sharp,
            'Bill',
          ),
          _buildCategory(
            context,
            Icons.gamepad,
            'Game',
          ),
          _buildCategory(
            context,
            Icons.wallet_giftcard,
            'Daily Gift',
          ),
          _buildCategory(
            context,
            Icons.more_horiz_rounded,
            'More',
          ),
        ],
      ),
    );
  }
}
