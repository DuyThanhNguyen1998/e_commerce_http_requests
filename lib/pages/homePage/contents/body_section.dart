import 'package:flutter/material.dart';

import './search_content.dart';
import './sale_notification.dart';
import './category_section.dart';
import './special_category.dart';
import './popular_product.dart';

class HomeBodySection extends StatelessWidget {
  const HomeBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Column(
        children: const [
          SearchContent(),
          Spacer(
            flex: 1,
          ),
          SaleNotification(),
          Spacer(
            flex: 1,
          ),
          CategorySection(),
          SpecialCategory(),
          PopularProduct(),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
