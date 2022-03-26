List<Map<String, dynamic>> _productBody = [
  {
    "id": '1',
    "name": 'Paracetamol',
    "requiresPrescription": "0",
    "price": 35000,
    "type": "Tablet",
    "size": "500mg",
    "soldBy": "Tobi Pharmaceuticals",
    "packSize": "8 X 12 (96)",
    "productID": 'PRO23642334',
    "constituents": "Paracetamol",
    "dispensedIn": 'Pack(s)',
    "summary": "1 pack of Paracetamol (500mg) contains 8 units of 12 tablets.",
    "imgURL":
        "https://res.cloudinary.com/dcxknh4in/image/upload/v1648206401/DRO%20app/paracetamol_c8kswo.png",
    "categoryID": '1',
  },
  {
    "id": '2',
    "name": 'Ratiopharm Paracetamol',
    "requiresPrescription": "1",
    "price": 50000,
    "type": "Tablet",
    "size": "500mg",
    "soldBy": "Kunle Pharmaceuticals",
    "packSize": "8 X 12 (96)",
    "productID": 'PRO53562739',
    "constituents": "Paracetamol",
    "dispensedIn": 'Pack(s)',
    "summary": "1 pack of Paracetamol (500mg) contains 8 units of 12 tablets.",
    "imgURL":
        "https://res.cloudinary.com/dcxknh4in/image/upload/v1648206401/DRO%20app/ratiopharmparacetamol_m9gu5k.png",
    "categoryID": '1',
  },
  {
    "id": '3',
    "name": 'Doliprane',
    "requiresPrescription": "1",
    "price": 35000,
    "type": "Capsule",
    "size": "500mg",
    "soldBy": "Doli Pharmaceuticals",
    "packSize": "8 X 12 (96)",
    "productID": 'PRO53562739',
    "constituents": "Doliprane",
    "dispensedIn": 'Pack(s)',
    "summary": "1 pack of Doliprane (500mg) contains 8 units of 12 tablets.",
    "imgURL":
        "https://res.cloudinary.com/dcxknh4in/image/upload/v1648206404/DRO%20app/doliprane_fu0nkr.png",
    "categoryID": '2',
  },
  {
    "id": '4',
    "name": 'Morrisons Ibuprofen',
    "requiresPrescription": "0",
    "price": 35000,
    "type": "Tablet",
    "size": "200mg",
    "soldBy": "Morrisons Pharmaceuticals",
    "packSize": "8 X 12 (96)",
    "productID": 'PRO64323350',
    "constituents": "Ibuprofren",
    "dispensedIn": 'Pack(s)',
    "summary":
        "1 pack of Morrisons Ibuprofen (200mg) contains 8 units of 12 tablets.",
    "imgURL":
        "https://res.cloudinary.com/dcxknh4in/image/upload/v1648206400/DRO%20app/ibuprofen_jabidi.png",
    "categoryID": '2',
  },
  {
    "id": '5',
    "name": 'Emzor Paracetamol',
    "requiresPrescription": "0",
    "price": 60000,
    "type": "Tablet",
    "size": "500mg",
    "soldBy": "Emzor Pharmaceuticals",
    "packSize": "8 X 12 (96)",
    "productID": 'PRO23648856',
    "constituents": "Paracetamol",
    "dispensedIn": 'Pack(s)',
    "summary":
        "1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.",
    "imgURL":
        "https://res.cloudinary.com/dcxknh4in/image/upload/v1648257293/DRO%20app/emzor_vfshvo.png",
    "categoryID": '1',
  },
  {
    "id": '6',
    "name": 'Panadol',
    "requiresPrescription": "0",
    "price": 35000,
    "type": "Tablet",
    "size": "500mg",
    "soldBy": "Pan Pharmaceuticals",
    "packSize": "8 X 12 (96)",
    "productID": 'PRO53562894',
    "constituents": "Panadol",
    "dispensedIn": 'Pack(s)',
    "summary": "1 pack of Panadol (500mg) contains 8 units of 12 tablets.",
    "imgURL":
        "https://res.cloudinary.com/dcxknh4in/image/upload/v1648206400/DRO%20app/panadol_wqehcp.png",
    "categoryID": '1',
  },
  {
    "id": '7',
    "name": 'Ibuprofen',
    "requiresPrescription": "0",
    "price": 35000,
    "type": "Tablet",
    "size": "400mg",
    "soldBy": "IB Pharmaceuticals",
    "packSize": "8 X 12 (96)",
    "productID": 'PRO53509385',
    "constituents": "Ibuprofen",
    "dispensedIn": 'Pack(s)',
    "summary": "1 pack of Doliprane (400mg) contains 8 units of 12 tablets.",
    "imgURL":
        "https://res.cloudinary.com/dcxknh4in/image/upload/v1648206401/DRO%20app/ibuprofen2_vdxdqg.png",
    "categoryID": '2',
  },

  ///iboprufen is used for body pains, but categorized it under supplements for example
];

List<Map<String, dynamic>> get productBody => _productBody;

class ProductsModel {
  final String id;
  final String requiresPrescription;
  final String name;
  final int price;
  final String type;
  final String size;

  final String soldBy;
  final String packSize;
  final String productID;
  final String constituents;
  final String dispensedIn;
  final String summary;

  final String imgURL;
  final String categoryId;
  // final List<CategoriesModel> categories;
  ProductsModel({
    required this.id,
    required this.name,
    required this.requiresPrescription,
    required this.price,
    required this.type,
    required this.size,
    required this.soldBy,
    required this.packSize,
    required this.productID,
    required this.constituents,
    required this.dispensedIn,
    required this.summary,
    required this.imgURL,
    required this.categoryId,
    // this.categories = const []
  });

  ProductsModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'] ?? '',
        requiresPrescription = parsedJson['requiresPrescription'] ?? '',
        name = parsedJson['name'] ?? '',
        price = parsedJson['price'] ?? 0,
        type = parsedJson['type'] ?? '',
        size = parsedJson['size'] ?? '',
        soldBy = parsedJson['soldBy'] ?? '',
        packSize = parsedJson['packSize'] ?? '',
        productID = parsedJson['productID'] ?? '',
        constituents = parsedJson['constituents'] ?? '',
        dispensedIn = parsedJson['dispensedIn'] ?? '',
        summary = parsedJson['summary'] ?? '',
        imgURL = parsedJson['imgURL'] ?? '',
        categoryId = parsedJson['categoryID'] ?? ''
  // categories = parsedJson['categories'] == null
  //     ? []
  //     : List<CategoriesModel>.from(parsedJson['categories']
  //         .map<CategoriesModel>(
  //             (data) => CategoriesModel.fromJson(data)))
  ;

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "name": name,
        "requiresPrescription": requiresPrescription,
        "price": price,
        "type": type,
        "size": size,
        "soldBy": soldBy,
        "packSize": packSize,
        "productID": productID,
        "constituents": constituents,
        "dispensedIn": dispensedIn,
        "summary": summary,
        "imgURL": imgURL,
        "categoryID": categoryId
      };
}
