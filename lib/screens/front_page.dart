import 'package:dro_app/utility/colours.dart';
import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_screens.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget {
  final int index;
  const FrontPage({Key? key, required this.index}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Doctors(),
    const Pharmacy(),
    const Community(),
    const Profile()
  ];

  int _index = 0;

  _onTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bottomNavigationBarColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/home.svg',
                color: _index == 0 ? droPurple : inActiveColor,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/doctor.svg',
                color: _index == 1 ? droPurple : inActiveColor,
              ),
              label: "Doctor"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/pharmacy.svg',
                color: _index == 2 ? droPurple : inActiveColor,
              ),
              label: "Pharmacy"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/community.svg',
                color: _index == 3 ? droPurple : inActiveColor,
              ),
              label: "Community"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/profile.svg',
                color: _index == 4 ? droPurple : inActiveColor,
              ),
              label: "Profile"),
        ],
        onTap: _onTap,
        currentIndex: _index,
      ),
    );
  }
}
