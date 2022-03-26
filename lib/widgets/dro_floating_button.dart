import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_providers.dart';
import 'package:dro_app/utility/export_screens.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class DROFloatingButton extends StatelessWidget {
  final bool round;
  const DROFloatingButton({Key? key, this.round = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: round
          ? Container(
              height: 45,
              width: 45,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  gradient: droRedGradient,
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  border: Border.all(color: white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: droRedGradientStart.withOpacity(.2),
                      blurRadius: 4,
                      spreadRadius: 1,
                      // blurStyle: BlurStyle.outer,
                      offset: const Offset(4, 6),
                    ),
                  ]),
              child: Consumer<ProductProvider>(
                  builder: (context, productProvider, child) {
                return productProvider.itemLength > 0
                    ? GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CartScreen())),
                      child: Badge(
                          badgeColor: badgeColor,
                          badgeContent:
                              Text(productProvider.itemLength.toString()),
                          child: DROCart(),
                        ),
                    )
                    : DROCart();
              }),
            )
          : GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => CartScreen())),
            child: Container(
                width: 140,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: droRedGradient,
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    border: Border.all(color: white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: droRedGradientStart.withOpacity(.2),
                        blurRadius: 4,
                        spreadRadius: 1,
                        // blurStyle: BlurStyle.outer,
                        offset: const Offset(4, 6),
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DROText(
                      text: 'Checkout',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: white,
                    ),
                    DROCart(),
                    Consumer<ProductProvider>(
                        builder: (context, productProvider, child) {
                      return productProvider.itemLength > 0
                          ? CircleAvatar(
                              backgroundColor: badgeColor,
                              child: DROText(
                                text: productProvider.itemLength.toString(),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                              radius: 10,
                            )
                          : Text('');
                    })
                  ],
                ),
              ),
          ),
    );
  }
}
