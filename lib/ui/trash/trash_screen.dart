import 'package:e_commerce_task/cubits/trash/trash_cubit.dart';
import 'package:e_commerce_task/ui/home/widgets/product/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrashScreen extends StatelessWidget {
  const TrashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrashCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Trash"),),
        body: const ProductsView(),
      ),
    );
  }
}
