import 'package:dro_app/utility/export_screens.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class SearchProduct extends StatefulWidget {
  SearchProduct({Key? key}) : super(key: key);

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  TextEditingController _searchController = TextEditingController();

  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const DROFloatingButton(
        round: true,
      ),
      body: CustomPage(
        title: 'Pharmacy',
        showSearchWidget: false,
        searchWidget: Row(
          children: [
            DROTextField(
              controller: _searchController,
              autoFocus: true,
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
            ),
            GestureDetector(
              onTap: () => setState(() {
                _searchController.text = '';
                text = '';
              }),
              child: DROText(
                text: 'Cancel',
                color: white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            )
          ],
        ),
        actions: [DeliveryIconView()],
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            DeliveryWidget(),
            text.isNotEmpty
                ? ProductsView(
                    queryText: text,
                    fromSearch: true,
                  )
                : Center()
          ],
        ),
      ),
    );
  }
}
