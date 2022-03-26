import 'package:dro_app/utility/export_utilities.dart';
import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

import 'custom_circle.dart';

class CustomPage extends StatelessWidget {
  final Widget body;
  final String title;
  final double titleSpacing;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget searchWidget;
  final Widget? bottomAppBar;
  final bool showSearchWidget;
  const CustomPage(
      {Key? key,
      required this.body,
      this.title = 'Pharmacy',
      this.titleSpacing = 0,
      this.titleWidget,
      this.searchWidget = const Center(),
      this.actions,
      this.showSearchWidget = true,
      this.bottomAppBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        physics: PageScrollPhysics(),
        headerSliverBuilder: (_, isScrolling) => <Widget>[
              SliverAppBar(
                titleSpacing: titleSpacing,
                expandedHeight: 140,
                pinned: true,
                //  toolbarHeight: 20,
                backgroundColor: Colors.transparent,

                title: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: titleWidget ?? Text(title),
                ),
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50.0),
                    child: bottomAppBar ??
                        Center(
                          child: showSearchWidget
                              ? const SearchWidget()
                              : searchWidget,
                        )),
                actions: actions,
                centerTitle: false,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: droPurpleGradient,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: const MenuDesign(),
                ),
              ),
              // SliverPersistentHeader(
              //   pinned: false,
              //   floating: true,
              //   delegate: _SliverAppBarDelegate(),
              // )
            ],
        body: body);
  }
}

///might not use this
// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) =>Container(
//     child: Text('Search'),
//   );
//
//   @override
//   // TODO: implement maxExtent
//   double get maxExtent => 80;
//
//   @override
//   // TODO: implement minExtent
//   double get minExtent => 60;
//
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>true;
//
// }
