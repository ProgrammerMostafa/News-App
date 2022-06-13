import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app_using_bloc/shared/components/components.dart';

import '../layout/news_layout.dart';
import '../my_bloc_observer.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';
import '../shared/network/local/cache_helper.dart';
import '../shared/network/remote/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ////////////////////////
  BlocOverrides.runZoned(
    () async {
      // Use blocs...
      HttpOverrides.global = MyHttpOverrides();
      /////////////////
      DioHelper.init();
      /////////////////
      await CacheHelper.init();
      /////////////////
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getAppModeSharedPreferences()
        ..getBusinessNews(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode:
                NewsCubit.get(ctx).isDark ? ThemeMode.dark : ThemeMode.light,
            //////////////////////
            theme: buildthemeData(
              isDarkTheme: false,
              mainColor:  const Color.fromARGB(255, 252, 252, 241),
              secondColor:  Colors.white,
            ),
            //////////////////////////////////
            darkTheme: buildthemeData(
              isDarkTheme: true,
              mainColor:  const Color.fromARGB(255, 26, 26, 26),
              secondColor: const Color.fromARGB(255, 34, 34, 34),
            ),
            //////////////////////////////
            home: const NewsScreen(),
          );
        },
      ),
    );
  }
}

///////////////////////////////////////////////////////////
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
