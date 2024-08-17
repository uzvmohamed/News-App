import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/config/themes.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/layout/layout.dart';
import 'package:news/network/local/cashe_helper.dart';
import 'package:news/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CasheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusiness()
        ..getSports()
        ..getPolitics(),
      child: BlocConsumer<NewsCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News',
            theme: theme(),
            home: const Layout(),
          );
        },
      ),
    );
  }
}
