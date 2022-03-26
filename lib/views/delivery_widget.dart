import 'package:dro_app/utility/export_utilities.dart';
import 'package:flutter/material.dart';

class DeliveryWidget extends StatelessWidget {
  const DeliveryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.all(10),
      color: deliveryBackground,
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          RichText(
            text: const TextSpan(
                text: 'Delivery in ',
                style: TextStyle(fontFamily: 'ProximaNova', color: black),
                children: [
                  TextSpan(
                      text: 'Lagos, NG',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'ProximaNova',
                          color: black))
                ]),
          )
        ],
      ),
    );
  }
}
