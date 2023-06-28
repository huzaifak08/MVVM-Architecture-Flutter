import 'package:flutter/material.dart';
import 'package:mvvm_architecture/Res/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;

  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.circular(23)),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: AppColor.whiteColor,
                )
              : Text(
                  title,
                  style: const TextStyle(
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
        ),
      ),
    );
  }
}
