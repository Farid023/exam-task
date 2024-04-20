import 'package:e_commerce_task/cubits/home/products/products_cubit.dart';
import 'package:e_commerce_task/ui/home/home_screen.dart';
import 'package:e_commerce_task/utils/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => ProductsCubit()..getProducts(),
        child: const HomeScreen(),
      ),
    );
  }
}
