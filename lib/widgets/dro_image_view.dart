import 'package:dro_app/utility/export_packages.dart';
import 'package:flutter/material.dart';

import '../utility/export_utilities.dart';

class DROImageView extends StatelessWidget {
  final String imageURL;
  final BoxFit boxFit;
  const DROImageView(
      {Key? key, required this.imageURL, this.boxFit = BoxFit.fill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      width: double.infinity,
      fit: boxFit,
      imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: imageProvider,
          fit: boxFit,
        ),
      )),
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: droPurple,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
