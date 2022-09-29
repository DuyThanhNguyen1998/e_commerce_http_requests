import 'package:flutter/material.dart';

class SpecialCategory extends StatelessWidget {
  const SpecialCategory({
    Key? key,
  }) : super(key: key);

  Widget _buildSpecialCategory(
    BuildContext context,
    Color? color,
    String title,
    String subtitle,
  ) {
    return InkWell(
      onTap: () {
        debugPrint('Special Item');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: color,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.65,
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
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
      height: 140,
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
                    'Special for you',
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
            height: 84,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildSpecialCategory(
                  context,
                  Colors.teal[400],
                  'Smartphone',
                  '18 Brands',
                ),
                _buildSpecialCategory(
                  context,
                  Colors.cyan[900],
                  'Fashion',
                  '24 Brands',
                ),
                _buildSpecialCategory(
                  context,
                  Colors.yellowAccent[700],
                  'Game',
                  '15 Brands',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
