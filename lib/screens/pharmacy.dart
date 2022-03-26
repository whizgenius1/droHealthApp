import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class Pharmacy extends StatelessWidget {
  const Pharmacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const DROFloatingButton(),
      body: CustomPage(
        titleSpacing: 25,
        actions: [
          DeliveryIconView()
        ],
        body: ListView(
          physics: PageScrollPhysics(),
          padding: EdgeInsets.all(0),
          children: const [DeliveryWidget(), CategoriesView(), ProductsView()],
        ),
      ),
    );
  }
}


class DeliveryIconView extends StatelessWidget {
  const DeliveryIconView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
      //  color: Colors.red,
      height: 10,
      child: Badge(
        badgeContent: const Text('1'),
        badgeColor: badgeColor,
        child: GestureDetector(
          onTap: () {},
          child: const DRODelivery(),
        ),
      ),
    );
  }
}

