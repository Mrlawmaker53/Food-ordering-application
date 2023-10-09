
import 'package:flutter/material.dart';
import 'package:quizz_assignment/utlits/utils.dart';

class CustomMainButton extends StatefulWidget {
  const CustomMainButton(
      {super.key,
      required this.child,
      required this.color,
      required this.isLoading,
      required this.onPressed});
  final Widget child;
  final Color color;
  final bool isLoading;
  final VoidCallback onPressed;
  @override
  State<CustomMainButton> createState() => _CustomMainButtonState();
}

class _CustomMainButtonState extends State<CustomMainButton> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        fixedSize: Size(screenSize.width * .5, 40),
      ),
      child: !widget.isLoading
          ? widget.child
          : const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
