import 'package:dro_app/utility/colours.dart';
import 'package:dro_app/utility/export_models.dart';
import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_screens.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:dro_app/utility/utility.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final ProductsModel productsModel;
  final bool fromSearch;
  const ProductView(
      {Key? key, required this.productsModel, this.fromSearch = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => AddToCart(
                    productsModel: productsModel,
                  ))),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 1,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      DROImageView(
                        imageURL: productsModel.imgURL,
                        boxFit: BoxFit.fitWidth,
                      ),
                      productsModel.requiresPrescription == '1'
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                width: double.infinity,
                                color: black.withOpacity(.5),
                                child: DROText(
                                  text: 'Requires a prescription',
                                  textAlign: TextAlign.center,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: white,
                                ),
                              ))
                          : Center()
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 0, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DROText(
                      text: productsModel.name,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    Container(
                      width: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DROText(
                            text: productsModel.type,
                            color: categoryTextColor.withOpacity(.6),
                            fontSize: 14,
                          ),
                          CircleAvatar(
                              radius: 2,
                              backgroundColor:
                                  categoryTextColor.withOpacity(.6)),
                          DROText(
                            text: productsModel.size,
                            color: categoryTextColor.withOpacity(.6),
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DROText(
                          text:
                              '${MoneyFormatter(amount: productsModel.price / 100, settings:
                              MoneyFormatterSettings(symbol: symbol, )).output.symbolOnLeft}',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        fromSearch ? ProductFavoriteView() : Center()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductFavoriteView extends StatefulWidget {
  const ProductFavoriteView({Key? key}) : super(key: key);

  @override
  State<ProductFavoriteView> createState() => _ProductFavoriteViewState();
}

class _ProductFavoriteViewState extends State<ProductFavoriteView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: droPurple.withOpacity(.15)),
      child: GestureDetector(
        onTap: () => setState(() {
          isFavorite = !isFavorite;
        }),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline,
          color: droPurple,
        ),
      ),
    );
  }
}
