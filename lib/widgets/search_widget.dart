import 'package:dro_app/utility/export_screens.dart';
import 'package:dro_app/utility/export_utilities.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context,
          MaterialPageRoute(builder: (_) => SearchProduct())),
      child: Container(
        decoration: BoxDecoration(
            color: white.withOpacity(.4),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              color: white,
            ),
            SizedBox(
              width: 20,
            ),
            DROText(
              text: 'Search',
              color: white,
            )
          ],
        ),
      ),
    );
  }
}
