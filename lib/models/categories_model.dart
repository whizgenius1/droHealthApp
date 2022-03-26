List<Map<String, String>> _categoryBody = [
  {
    "id": "1",
    "name": 'Headache',
    "imgURL":
        'https://res.cloudinary.com/dcxknh4in/image/upload/v1648203981/DRO%20app/headache_us0xaq.jpg',
  },
  {
    "id": "2",
    "name": 'Supplements',
    "imgURL":
        'https://res.cloudinary.com/dcxknh4in/image/upload/v1648204421/DRO%20app/supplements_vss7kg.jpg',
  },
  {
    "id": "3",
    "name": 'Infants',
    "imgURL":
        'https://res.cloudinary.com/dcxknh4in/image/upload/v1648204419/DRO%20app/infant_wxq6b0.jpg',
  },
  {
    "id": "4",
    "name": 'Cough',
    "imgURL":
        'https://res.cloudinary.com/dcxknh4in/image/upload/v1648204422/DRO%20app/cough_tu4ci9.jpg',
  }
];
List<Map<String, String>> get categoryBody => _categoryBody;

class CategoriesModel {
  final String id;
  final String name;
  final String imgURL;
  CategoriesModel({required this.id, required this.name, required this.imgURL});

  CategoriesModel.fromJson(Map<String, String> parsedJson)
      : id = parsedJson['id'] ?? '',
        name = parsedJson['name'] ?? '',
        imgURL = parsedJson['imgURL'] ?? '';

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "name": name,
        "imgURL": imgURL,
      };
}
