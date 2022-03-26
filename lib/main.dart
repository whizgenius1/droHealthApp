import 'package:dro_app/screens/front_page.dart';
import 'package:dro_app/utility/export_packages.dart';
import 'package:dro_app/utility/export_providers.dart';
import 'package:dro_app/utility/export_services.dart';
import 'package:flutter/material.dart';
import 'package:dro_app/utility/export_utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(
    fileName: ".env",
  );

  ConnectionStatus.getInstance().initialize();
  await SharedPrefUtils().init();
  //setupLocator();
  await putProductToDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: buildTheme,
        home: const FrontPage(
          index: 2,
        ),
      ),
    );
  }
}
