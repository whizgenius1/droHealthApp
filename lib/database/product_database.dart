import 'package:dro_app/utility/export_models.dart';
import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_utilities.dart';

String _tableName = userDatabase.productTable;

///instead of sending null value, creating a instance of the class and initialise it
ProductsModel _emptyProductModel = ProductsModel(
    id: '',
    name: '',
    requiresPrescription: '',
    price: 0,
    type: '',
    size: '',
    soldBy: '',
    packSize: '',
    productID: '',
    constituents: '',
    dispensedIn: '',
    summary: '',
    imgURL: '',
    categoryId: '');

Future<int> insertProduct({required ProductsModel productsModel}) async =>
    await getDatabase().then((Database database) async => await database
        .insert(_tableName, productsModel.toMap())
        .then((value) async => await value));

Future<int> updateProduct({required ProductsModel productsModel}) async =>
    await getDatabase().then((Database database) => database.update(
        _tableName, productsModel.toMap(),
        where: 'id=?',
        whereArgs: [productsModel.id]).then((value) async => await value));

Future<void> putProduct({required ProductsModel productsModel}) async =>
    await getDatabase().then((Database database) async => await database
        .query(_tableName,
            columns: ['id'], where: 'id=?', whereArgs: [productsModel.id])
        .then((value) async => await value.isEmpty
            ? await insertProduct(productsModel: productsModel)
            : await updateProduct(productsModel: productsModel)));

Future<List<ProductsModel>> getAllProducts() async =>
    await getDatabase().then((Database database) async => await database
        .query(_tableName)
        .then((value) async => await value.isEmpty
            ? []
            : value
                .map<ProductsModel>((e) => ProductsModel.fromJson(e))
                .toList()));

Future<ProductsModel> getProductByID({required String productID}) async =>
    getDatabase().then((Database database) async => await database
        .query(_tableName, where: 'id=?', whereArgs: [productID]).then(
            (value) async => value.isEmpty
                ? _emptyProductModel
                : ProductsModel.fromJson(value[0])));

Future<List<ProductsModel>> getProductByCategoryID(
        {required String categoryID}) async =>
    getDatabase().then((Database database) async => await database
        .query(_tableName, where: 'categoryID=?', whereArgs: [categoryID]).then(
            (value) async => value.isEmpty
                ? []
                : value
                    .map<ProductsModel>((e) => ProductsModel.fromJson(e))
                    .toList()));

Future<List<ProductsModel>> searchProductModel(
        {required String queryText}) async =>
    getDatabase().then((Database database) async => await database.rawQuery('''
      SELECT * FROM $_tableName WHERE $_tableName MATCH "*$queryText*"
      ''').then((value) async => await value
            .isEmpty
        ? []
        : value.map<ProductsModel>((e) => ProductsModel.fromJson(e)).toList()));
