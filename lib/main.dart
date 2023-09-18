import 'package:dating_app_assignment/common/values/colors.dart';
import 'package:dating_app_assignment/ui/bloc/app_bloc.dart';
import 'package:dating_app_assignment/ui/screens/home/widgets/bottom_bar_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'repository/db_repositry.dart';
import 'ui/screens/home/bloc/home_bloc.dart';

late final FirebaseApp app;
late final FirebaseDatabase database;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  database = FirebaseDatabase.instanceFor(app: app);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppBloc()),
        BlocProvider(create: (_) => HomeBloc(DbRepositoryImpl())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dating App Assignment',
        theme: ThemeData(
          primarySwatch: AppColors.mainAppColor,
        ),
        home: const BottomNavBar(),
      )
    );
  }
}
