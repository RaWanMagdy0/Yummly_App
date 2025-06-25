import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/base/app_bloc_observer.dart';
import 'core/di/di.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/page_route_name.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    FirebaseAnalyticsObserver observer =
        FirebaseAnalyticsObserver(analytics: analytics);

    return LayoutBuilder(
      builder: (context, constrains) {
        return ScreenUtilInit(
          designSize: Size(constrains.maxWidth, constrains.maxHeight),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, index) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.appTheme,
              initialRoute: PageRouteName.addRecipeScreen,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              navigatorObservers: [observer],
            );
          },
        );
      },
    );
  }
}
