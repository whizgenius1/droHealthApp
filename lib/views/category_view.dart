import 'package:dro_app/utility/colours.dart';
import 'package:dro_app/utility/export_models.dart';
import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_screens.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const CategoryView({Key? key, required this.categoriesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>CategoryProduct(
        categoriesModel:categoriesModel,
      ))),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)),
        // height: 100,
        width: 130,
        child: Stack(
          children: [
            DROImageView(
              imageURL: categoriesModel.imgURL,
            ),
            Center(
                child: DROText(
              text: categoriesModel.name,
              color: white,
              fontWeight: FontWeight.w700,
            ))
          ],
        ),
      ),
    );
  }
}


