import 'package:basket_ball/cubits/home/home_cubit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElevatedCustomButton extends StatelessWidget {
  ElevatedCustomButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.id,
    this.reset = false,
  });
  final String text;
  final void Function()? onPressed;
  final int id;
  bool? reset;

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.instance(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        backgroundColor: reset!
            ? Colors.amber
            : id == cubit.buttonPressedId
                ? Colors.orange
                : Colors.amber,
        minimumSize: const Size(150, 50),
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
        if (!reset!) {
          cubit.setButtonPressed(id: id);
        } else {
          cubit.reSetButtonPressed();
        }
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
