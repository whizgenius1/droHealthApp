import 'package:dro_app/utility/export_packages.dart';
import 'package:flutter/material.dart';

import 'export_utilities.dart';

ThemeData get buildTheme => _builderTheme();

ThemeData _builderTheme() => ThemeData.light().copyWith(
      primaryColor: droPurple,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: droPurple,
          iconTheme: IconThemeData(color: white, size: 14)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: bottomNavigationBarColor,
          selectedItemColor: droPurple,
          unselectedItemColor: inActiveColor,
          selectedIconTheme: const IconThemeData(
            color: droPurple,
            //  size: 14
          ),
          selectedLabelStyle: const TextStyle(
              color: droPurple,
              fontWeight: FontWeight.w400,
              letterSpacing: .5,
              fontSize: 12),
          unselectedLabelStyle: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  color: inActiveColor,
                  letterSpacing: .5,
                  fontWeight: FontWeight.w400,
                  fontSize: 12))),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(droPurple.withOpacity(.3)),
        foregroundColor: MaterialStateProperty.all(droPurple),
      )),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ButtonStyle(
      //         elevation: MaterialStateProperty.all(5),
      //         shadowColor: MaterialStateProperty.all(droRedGradientStart),
      //         padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
      //         foregroundColor: MaterialStateProperty.all(droRedGradientStart.withOpacity(.0)),
      //         backgroundColor:MaterialStateProperty.all(droRedGradientStart.withOpacity(.0)),
      //         overlayColor:MaterialStateProperty.all(droRedGradientStart.withOpacity(.0)),
      //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(30.0))))),
      ///
      // buttonTheme: ButtonThemeData(
      //    buttonColor: droPurple,
      //
      //     // disabledColor: disableOrange,
      //     shape: StadiumBorder(),
      //     textTheme: ButtonTextTheme.primary),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: white.withOpacity(0)),
      focusColor: droPurple,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        focusColor: droPurple,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide.none),
      ),
    );
