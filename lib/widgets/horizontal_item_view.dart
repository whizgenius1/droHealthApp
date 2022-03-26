import 'package:dro_app/utility/export_database.dart';
import 'package:dro_app/utility/export_services.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

class HorizontalItemView extends StatelessWidget {
  final bool fromCategory;
  final String categoryID;
  final String productID;
  const HorizontalItemView(
      {Key? key,
      required this.fromCategory,
      this.categoryID = '',
      this.productID = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: fromCategory ? 110 : 200,
        child: FutureBuilder(
            future: fromCategory
                ? getCategory()
                : getProductByCategoryID(categoryID: categoryID),
            builder: (_, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:

                  ///write widget to display when trying to get categories
                  return const Center();
                case ConnectionState.done:
                  return snapshot.hasData
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, index) => fromCategory
                              ? CategoryView(
                                  categoriesModel: snapshot.data[index] ?? '',
                                )
                              : productID == snapshot.data[index].id
                                  ? Center()
                                  : SizedBox(
                                      width: 150,
                                      child: ProductView(
                                          productsModel: snapshot.data[index])))
                      : Center();
                default:
                  return const Center();
              }
            }));
  }
}
