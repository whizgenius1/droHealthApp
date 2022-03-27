import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_services.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPage(
        showSearchWidget: false,
        title: 'Categories',
        actions: [const DROCartTap()],
        body: FutureBuilder(
          future: getCategory(),
          builder: (_, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:

                ///write widget to display when trying to get categories
                return const Center();
              case ConnectionState.done:
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            mainAxisExtent: 130,
                            childAspectRatio: 1),
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) => CategoryView(
                          categoriesModel: snapshot.data[index] ?? '',
                        ));
              default:
                return const Center();
            }
          },
        ),
      ),
    );
  }
}
