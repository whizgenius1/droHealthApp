import 'package:dro_app/models/categories_model.dart';
import 'package:dro_app/utility/export_models.dart';

///can still use database or get the data from a server  for this,
///but here is a simplified way since,
///I'm hard coding the data in the categories_model file
Future<List<CategoriesModel>> getCategory() async =>
    categoryBody.map((data) => CategoriesModel.fromJson(data)).toList();


//618991