import 'package:dro_app/utility/export_database.dart';
import 'package:dro_app/utility/export_models.dart';
import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class ProductsView extends StatelessWidget {
  final String queryText;
  final bool fromSearch;
  const ProductsView({Key? key, this.queryText = '', this.fromSearch = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          queryText.isNotEmpty
              ? Center()
              : SizedBox(
                  height: 20,
                ),
          queryText.isNotEmpty
              ? Center()
              : Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: DROText(
                    text: 'SUGGESTIONS',
                    color: categoryTextColor.withOpacity(.4),
                    fontWeight: FontWeight.w600,
                  ),
                ),
          FutureBuilder(
              future: fromSearch
                  ? searchProductModel(queryText: queryText)
                  : getAllProducts(),
              builder: (_, AsyncSnapshot snapshot) {
                List<ProductsModel> productsModel = snapshot.data ?? [];

                if (productsModel.isNotEmpty) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:

                      ///write widget to display when trying to get categories
                      return const Center();

                    case ConnectionState.done:
                      return GridView.builder(
                        padding: const EdgeInsets.all(10),
                        shrinkWrap: true,
                        physics: PageScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 20,
                                mainAxisExtent: 190,
                                childAspectRatio: 1),
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) => ProductView(
                          productsModel: productsModel[index],
                          fromSearch: fromSearch,
                        ),
                      );
                    default:
                      return const Center();
                  }
                } else {
                  return fromSearch
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/not_found.svg',
                                fit: BoxFit.cover,
                                //  alignment: Alignment.center,
                              ),
                              DROText(
                                text: 'No result found for “$queryText”',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
                        )
                      : Center();
                }
              })
        ],
      ),
    );
  }
}
