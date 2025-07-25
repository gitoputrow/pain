import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pain/feature/authentification/view/HomeScreen.dart';
import 'package:pain/appRoutes.dart';
import 'package:pain/feature/authentification/view/splashscreen.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';
import 'package:responsive_framework/responsive_wrapper.dart';


void main() async {
  Intl.defaultLocale = await findSystemLocale();
  await initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;

  @override
  void initState() {
    // init();
    // TODO: implement initState
    super.initState();
  }

  // Future init() async {
  //   try {
  //     token = await StorageProvider.getUserToken();
  //     print("aaa$token");
  //     setState(() {
        
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1600,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.autoScale(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET, scaleFactor: 1.5),
          //ResponsiveBreakpoint.resize(1200, name: DESKTOP, scaleFactor: 2),
        ],
      ),
      getPages: appRoutes.pages,
      initialRoute: "/splashscreen",
      initialBinding: InitialBinding(),
    );
  }
}

