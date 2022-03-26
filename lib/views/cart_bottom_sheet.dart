import 'package:dro_app/screens/front_page.dart';
import 'package:dro_app/utility/export_screens.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class CartBottomSheet extends StatelessWidget {
  final String productName;
  const CartBottomSheet({Key? key, required this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * .35,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DROText(
            text: '$productName has been successfully added to cart!',
            textAlign: TextAlign.center,
            fontSize: 18,
          ),
          const SizedBox(
            height: 20,
          ),
          DROCustomButton(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => CartScreen())),
            child: DROText(
              text: 'VIEW CART',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            child: OutlinedButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(droPurple.withOpacity(.3)),
                    side: MaterialStateProperty.all(BorderSide(
                        color: droPurple, width: 2, style: BorderStyle.solid)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: droPurple,
                            width: 2,
                            style: BorderStyle.solid))),
                    foregroundColor: MaterialStateProperty.all(droPurple)),
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FrontPage(
                              index: 2,
                            ))),
                child: DROText(
                  text: 'CONTINUE SHOPPING',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: droPurple,
                )),
          )
        ],
      ),
    );
  }
}
