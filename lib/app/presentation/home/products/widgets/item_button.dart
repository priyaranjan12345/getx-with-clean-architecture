import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget widget;
  const ItemButton({Key? key, required this.onTap, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 50,
      child: ElevatedButton(
        child: widget,
        onPressed: onTap,
      ),
    );
  }
}
