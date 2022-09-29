import 'package:flutter/material.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({super.key});

  Widget _buildPoppularProduct(
    BuildContext context,
    Color? color,
    String title,
  ) {
    return InkWell(
      onTap: () {
        debugPrint('Popular Item');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: color,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.only(
        left: 8,
        top: 8,
        bottom: 8,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Popular Product',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See More',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 144,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildPoppularProduct(
                  context,
                  Colors.teal[700],
                  'Game',
                ),
                _buildPoppularProduct(
                  context,
                  Colors.cyan[300],
                  'Pan',
                ),
                _buildPoppularProduct(
                  context,
                  Colors.yellow[800],
                  'Electronic',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
