import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_providers.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
          child: Consumer<ProductProvider>(
              builder: (context, productProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Total: ",
                        style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: categoryTextColor),
                        children: [
                      TextSpan(
                          text: MoneyFormatter(
                                  amount: productProvider.totalPrice / 100,
                                  settings:
                                      MoneyFormatterSettings(symbol: symbol))
                              .output
                              .symbolOnLeft,
                          style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: categoryTextColor))
                    ])),
                Expanded(
                  child: DROCustomButton(
                      width: MediaQuery.of(context).size.width * .5,
                      onPressed: () {
                        ///write function to check out and clear cart list
                        ///
                        productProvider.clearProductItem();
                      },
                      child: DROText(
                        text: 'CHECKOUT',
                        color: white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      )),
                )
              ],
            );
          }),
        ),
      ),
      body: CustomPage(
        showSearchWidget: false,
        titleWidget: Row(
          children: [
            DROCart(),
            SizedBox(
              width: 20,
            ),
            DROText(
              text: 'Cart',
              fontSize: 22,
              color: white,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
        body: Consumer<ProductProvider>(
          builder: (context, productProvider, child) => ListView.builder(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            itemCount: productProvider.itemLength,
            itemBuilder: (_, index) => Column(
              children: [
                CartView(
                  productItem:
                      productProvider.productItem.values.toList()[index],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Divider(
                    color: deliveryBackground,
                    thickness: 1.5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartView extends StatelessWidget {
  final ProductItem productItem;
  CartView({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: DROImageView(
                      imageURL: productItem.productsModel.imgURL,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DROText(
                        text: productItem.productsModel.name,
                        color: categoryTextColor,
                        fontSize: 16,
                      ),
                      DROText(
                          text:
                              '${productItem.productsModel.type}-${productItem.productsModel.size}',
                          color: Color(0xFFBDBDBD)),
                      DROText(
                        text: MoneyFormatter(
                                amount: productItem.productsModel.price / 100,
                                settings:
                                    MoneyFormatterSettings(symbol: symbol))
                            .output
                            .symbolOnLeft,
                        color: categoryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 68,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE5E5E5), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton<int>(
                      focusColor: droPurple,
                      iconEnabledColor: droPurple,

                      ///could also assign this to a map and build the items,
                      ///but this seems shorter for a test
                      items: List.generate(
                          9,
                          (index) => index > 0
                              ? DropdownMenuItem(
                                  alignment: Alignment.center,
                                  value: index,
                                  child: Text(index.toString()))
                              : DropdownMenuItem(value: 0, child: Text(''))),
                      value: productItem.quantity,
                      onChanged: (value) {
                        productProvider.addProductItem(
                            id: productItem.id,
                            productsModel: productItem.productsModel,
                            quantity: value!);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () =>
                        productProvider.removeProductItem(id: productItem.id),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/delete.svg'),
                        DROText(
                          text: 'Remove',
                          fontSize: 12,
                          color: droPurple,
                        )
                      ],
                    ),
                  )
                ],
              );
            })
          ],
        ),
      );
    });
  }
}
