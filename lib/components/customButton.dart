import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Icon? buttonIcon;
  final void Function()? onTap;

  const CustomButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 150,
      child: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 105, 172, 239),
        )),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              buttonText,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            if (buttonIcon != null) Icon(buttonIcon!.icon),
          ],
        ),
      ),
    );
  }
}
