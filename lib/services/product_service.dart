import 'package:dro_app/utility/export_database.dart';
import 'package:dro_app/utility/export_models.dart';

Future<List<ProductsModel>> getProductModel() async =>
    await productBody.map((data) => ProductsModel.fromJson(data)).toList();

///puts the product in the database from the dummy data created in the product_model.dart file
Future<void> putProductToDB() async {
  await getProductModel().then((List<ProductsModel> productsModel) =>
      productsModel.forEach((element) async {
        await putProduct(productsModel: element);
      }));
}
