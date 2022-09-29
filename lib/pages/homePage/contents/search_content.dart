import 'package:flutter/material.dart';

import './bubble_icon.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 120,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_rounded,
                  color: Colors.grey[600],
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.5,
                  alignment: Alignment.center,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search product',
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(
          flex: 5,
        ),
        const BubbleIcon(
          icon: Icons.shopping_cart_outlined,
          amount: 4,
        ),
        const Spacer(
          flex: 5,
        ),
        const BubbleIcon(
          icon: Icons.notifications_none_rounded,
          amount: 3,
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
