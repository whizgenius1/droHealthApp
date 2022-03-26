import 'package:dro_app/utility/export_screens.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class CategoriesView extends StatelessWidget {
  final bool fromCategory;
  const CategoriesView({Key? key, this.fromCategory = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DROText(
                  text: 'CATEGORIES',
                  color: categoryTextColor.withOpacity(.4),
                  fontWeight: FontWeight.w600,
                ),
                DROTextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Categories())),
                  text: 'VIEW ALL',
                )
              ],
            ),
          ),
          HorizontalItemView(
            fromCategory: fromCategory,
          )
        ],
      ),
    );
  }
}



