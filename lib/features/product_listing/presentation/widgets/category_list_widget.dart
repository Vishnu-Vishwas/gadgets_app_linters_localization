import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/dummy_data.dart';
import 'package:gizmogrub_lints_localization/features/product_listing/presentation/widgets/catergory_card_widget.dart';

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({super.key});

  @override
  State<CategoryListWidget> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategoryListWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: DummyProducts.gadgetCategories.length,
    separatorBuilder:
        (BuildContext context, int index) => const SizedBox(width: 14),
    itemBuilder:
        (BuildContext context, int index) => CategoryCard(
          categoryName: DummyProducts.gadgetCategories[index],
          isSelected: _selectedIndex == index,
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
  );
}
