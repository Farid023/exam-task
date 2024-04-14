import 'package:e_commerce_task/ui/trash/trash_screen.dart';
import 'package:flutter/material.dart';

class AppBarCartButton extends StatelessWidget {
  const AppBarCartButton({super.key, required this.deletedItemsCount});

  final String deletedItemsCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const TrashScreen()));
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ),
        Container(


          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              deletedItemsCount,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
