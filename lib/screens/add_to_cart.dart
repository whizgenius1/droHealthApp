import 'package:dro_app/screens/front_page.dart';
import 'package:dro_app/utility/export_models.dart';
import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_providers.dart';
import 'package:dro_app/utility/export_screens.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class AddToCart extends StatelessWidget {
  final ProductsModel productsModel;
  final bool fromSearch;
  const AddToCart(
      {Key? key, required this.productsModel, required this.fromSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPage(
        showSearchWidget: false,
        actions: [const DROCartTap()],
        body: AddCartView(
          fromSearch: fromSearch,
          productsModel: productsModel,
        ),
      ),
    );
  }
}

class AddCartView extends StatefulWidget {
  final ProductsModel productsModel;
  final bool fromSearch;
  const AddCartView(
      {Key? key, required this.productsModel, required this.fromSearch})
      : super(key: key);

  @override
  State<AddCartView> createState() => _AddCartViewState();
}

class _AddCartViewState extends State<AddCartView> {
  int _quantity = 1;
  List<String> splitPrice = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    num price = widget.productsModel.price / 100;
    String priceInString = price.toStringAsFixed(2);

    splitPrice = priceInString.split('.');
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillScope() async {
      //   Navigator.pop(context);
      widget.fromSearch
          ? Navigator.push(
              context, MaterialPageRoute(builder: (_) => SearchProduct()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => FrontPage(index: 2)));
      return false;
    }

    return WillPopScope(
      onWillPop: _onWillScope,
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 80,
          child: BottomAppBar(

            child: Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
              return DROCustomButton(

                onPressed: () {
                  productProvider.addProductItem(
                      id: widget.productsModel.id,
                      productsModel: widget.productsModel,
                      quantity: _quantity);

                  showModalBottomSheet(
                      context: context,
                      builder: (_) => CartBottomSheet(
                            productName: widget.productsModel.name,
                          ));
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DROCart(),
                      const SizedBox(
                        width: 15,
                      ),
                      DROText(
                        text: 'Add to cart',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: white,
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.height * .15,
                  child: DROImageView(
                    imageURL: widget.productsModel.imgURL,
                    boxFit: BoxFit.contain,
                  )),
              const SizedBox(
                height: 10,
              ),
              DROText(
                text: widget.productsModel.name,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: black,
              ),
              const SizedBox(
                height: 5,
              ),
              DROText(
                text:
                    '${widget.productsModel.type} - ${widget.productsModel.size}',
                textAlign: TextAlign.center,
                color: black.withOpacity(.5),
                fontSize: 18,
              ),
              const SizedBox(
                height: 10,
              ),

              ///pharmacy
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ///had to load image cus the svg file was too big (447.98kb)
                      Image.asset(
                        'assets/images/emzor.png',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DROText(
                            text: 'SOLD BY',
                            color: lightCartTextColor,
                            fontSize: 10,
                          ),
                          DROText(
                            text: widget.productsModel.soldBy,
                            fontSize: 14,
                            color: boldCartTextColor,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      )
                    ],
                  ),
                  ProductFavoriteView()
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              ///packs and price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///counter
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        width: MediaQuery.of(context).size.width * .25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: inActiveColor.withOpacity(.3))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: IconButton(
                                  onPressed: _quantity <= 0
                                      ? null
                                      : () => setState(() {
                                            _quantity -= 1;
                                          }),
                                  icon: Icon(Icons.remove)),
                            ),
                            DROText(
                              text: _quantity.toString(),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                            Expanded(
                              ///limited the maximum quantity to 8 so as not to cause an error on the cart page,
                              ///because of the value number
                              child: IconButton(
                                  onPressed: _quantity >= 8
                                      ? null
                                      : () => setState(() {
                                            _quantity += 1;
                                          }),
                                  icon: Icon(Icons.add)),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      DROText(
                        text: widget.productsModel.dispensedIn,
                        color: black.withOpacity(.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),

                  ///price
                  Container(
                    height: 34,
                    child: Row(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: DROText(
                              text: symbol,
                              color: black,
                              fontSize: 14,
                            )),
                        DROText(
                          text: '${splitPrice[0]}',
                          fontSize: 32,
                          color: black,
                          fontWeight: FontWeight.w700,
                        ),
                        DROText(
                          text: '.',
                          fontSize: 32,
                          color: black,
                          fontWeight: FontWeight.w700,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: DROText(
                            text: '${splitPrice[1]}',
                            textAlign: TextAlign.end,
                            fontSize: 18,
                            color: black,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DROText(
                    text: "PRODUCT DETAILS",
                    color: lightCartTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/svg/pack_size.svg'),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DROText(
                                  text: 'PACK SIZE',
                                  fontSize: 10,
                                  color: lightCartTextColor,
                                ),
                                DROText(
                                  text: widget.productsModel.packSize +
                                      ' ' +
                                      widget.productsModel.type.toLowerCase() +
                                      "s",
                                  color: boldCartTextColor,
                                  fontWeight: FontWeight.w700,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svg/product_id.svg'),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DROText(
                                    text: 'PRODUCT ID',
                                    fontSize: 10,
                                    color: lightCartTextColor,
                                  ),
                                  DROText(
                                    text: widget.productsModel.productID,
                                    color: boldCartTextColor,
                                    fontWeight: FontWeight.w700,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/svg/constituents.svg'),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DROText(
                                  text: 'CONSTITUENTS',
                                  fontSize: 10,
                                  color: lightCartTextColor,
                                ),
                                DROText(
                                  text: widget.productsModel.constituents,
                                  color: boldCartTextColor,
                                  fontWeight: FontWeight.w700,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svg/dispense.svg'),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DROText(
                                    text: 'DISPENSED IN',
                                    fontSize: 10,
                                    color: lightCartTextColor,
                                  ),
                                  DROText(
                                    text: widget.productsModel.dispensedIn,
                                    color: boldCartTextColor,
                                    fontWeight: FontWeight.w700,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DROText(
                text: widget.productsModel.summary,
                fontSize: 14,
                color: black.withOpacity(.5),
              ),
              const SizedBox(
                height: 20,
              ),
              DROText(
                text: 'Similar Products',
                fontSize: 18,
                color: categoryTextColor.withOpacity(.8),
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 10,
              ),
              HorizontalItemView(
                fromCategory: false,
                categoryID: widget.productsModel.categoryId,
                productID: widget.productsModel.id,
              )
            ],
          ),
        ),
      ),
    );
  }
}
