import 'package:flutter/material.dart';
import 'package:gastra_soft/config/app_router.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String route = AppRouter.homePage;
    return Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          initialRoute: route,
          onGenerateRoute: AppRouter.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          title: 'gastrasoft'
        );
      }
    );
  }
}
