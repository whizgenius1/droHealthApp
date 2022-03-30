import 'dart:io';

import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utility/export_utilities.dart';

class Pharmacy extends StatelessWidget {
  const Pharmacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///ask users if they want to exit app
    Future<bool> _onWillScope() async {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: DROText(
                  text: 'Exit App',
                  textAlign: TextAlign.center,
                  fontSize: 20,
                ),
                content: DROText(
                  text: 'Are you sure you want to close DRO Health?',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  DROTextButton(
                      onPressed: () => Navigator.pop(context), text: 'No'),

                  ///this function closes the app?
                  DROTextButton(onPressed: () => exit(0), text: 'Yes')
                ],
              ));
      return false;
    }

    return WillPopScope(
      onWillPop: _onWillScope,
      child: Scaffold(
        floatingActionButton: const DROFloatingButton(),
        body: CustomPage(
          titleSpacing: 25,
          leading: Center(),
          leadingWidth: 0,
          actions: [DeliveryIconView()],
          body: ListView(
            physics: PageScrollPhysics(),
            padding: EdgeInsets.all(0),
            children: const [
              DeliveryWidget(),
              CategoriesView(),
              ProductsView(),

          ],
          ),
        ),
      ),
    );
  }
}

class DeliveryIconView extends StatelessWidget {
  const DeliveryIconView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
