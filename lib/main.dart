import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttetapi/src/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:fluttetapi/src/features/authentication/presentation/screen/authentication_screen.dart';
import 'package:fluttetapi/src/features/movie/presentation/screen/movie_screen.dart';

import 'src/core/injection_container.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => AuthenticationCubit(
          repository: sl(),
        ),
        child: const AuthenticationScreen(),
      ),
    );
  }
}
