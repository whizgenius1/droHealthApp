import 'package:dro_app/models/categories_model.dart';
import 'package:dro_app/utility/export_database.dart';
import 'package:dro_app/utility/export_models.dart';
import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_utilities.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

class CategoryProduct extends StatelessWidget {
  final CategoriesModel categoriesModel;

  const CategoryProduct({Key? key, required this.categoriesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPage(
            showSearchWidget: false,
            title: 'Categories',
            actions: [const DROCartTap()],
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: DROText(
                    text: categoriesModel.name.toUpperCase(),
                    color: categoryTextColor.withOpacity(.4),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                FutureBuilder(
                    future:
                        getProductByCategoryID(categoryID: categoriesModel.id),
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
                                // fromSearch: fromSearch,
                              ),
                            );
                          default:
                            return const Center();
                        }
                      } else {
                        return Center(
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
                                text: 'No result found',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
                        );
                      }
                    })
              ],
            )));
  }
}
