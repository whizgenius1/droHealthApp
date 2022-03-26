import 'package:dro_app/utility/colours.dart';
import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_providers.dart';
import 'package:dro_app/utility/export_screens.dart';
import 'package:flutter/material.dart';

class DROCartTap extends StatelessWidget {
  const DROCartTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
      //  color: Colors.red,
      height: 10,
      child:
          Consumer<ProductProvider>(builder: (context, productProvider, child) {
        return productProvider.itemLength > 0
            ? GestureDetector(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartScreen())),
                child: Badge(
                  badgeContent: Text(productProvider.itemLength.toString()),
                  badgeColor: badgeColor,
                  child: SvgPicture.asset('assets/svg/cart.svg'),
                ),
              )
            : DROCart();
      }),
    );
  }
}

class DROCart extends StatelessWidget {
  const DROCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/cart.svg',
      fit: BoxFit.contain,
    );
  }
}

class DRODelivery extends StatelessWidget {
  const DRODelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/svg/delivery.svg');
  }
}
