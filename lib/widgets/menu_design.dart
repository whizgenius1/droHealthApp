import 'package:dro_app/utility/export_widgets.dart';
import 'package:flutter/material.dart';

class MenuDesign extends StatelessWidget {
  const MenuDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    ///ClipRRect prevents the design from spanning outside the box
    return ClipRRect(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .2,
              child: Stack(
                children: [
                  //first
                  SizedBox(
                    height: 120,
                    child: CustomCircle(
                      opacity: .3,
                      radius: width * .21,
                    ),
                  ),
                  //second
                  SizedBox(
                    height: 100,
                    child: CustomCircle(
                      opacity: .3,
                      radius: width * .24,
                    ),
                  ),
                  //third
                  SizedBox(
                    height: 80,
                    child: CustomCircle(
                      opacity: .3,
                      radius: width * .27,
                    ),
                  ),
                  //forth
                  SizedBox(
                    height: 60,
                    child: CustomCircle(
                      opacity: .3,
                      radius: width * .30,
                    ),
                  ),
                  //fifth
                  SizedBox(
                    height: 40,
                    child: CustomCircle(
                      opacity: .3,
                      radius: width * .33,
                    ),
                  ),
                  //sixth
                  SizedBox(
                    height: 68,
                    child: CustomCircle(
                      opacity: .3,
                      radius: width * .36,
                    ),
                  ),
                  //seventh
                  SizedBox(
                    height: 85,
                    child: CustomCircle(
                      opacity: .3,
                      radius: width * .43,
                    ),
                  ),

                  //eighth
                  SizedBox(
                    height: 150,
                    child: CustomCircle(
                      opacity: .2,
                      radius: width * .40,
                    ),
                  ),
                  SizedBox(
                    height: 170,
                    child: CustomCircle(
                      opacity: .2,
                      radius: width * .47,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
