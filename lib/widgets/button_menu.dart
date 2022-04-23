import 'package:flutter/material.dart';
import 'package:karc_pf/constants.dart';

class MenuButton extends StatelessWidget {
  const MenuButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.index,
      this.size = 70,
      this.iconSize = 30,
      this.isSelected = false})
      : super(key: key);

  final double size;
  final IconData icon;
  final double iconSize;
  final bool isSelected;
  final VoidCallback onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: OnHoverButton(
        builder: (isHovered) => Container(
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(
              //   Radius.circular(18.0),
              // ),
              color: Colors.black87,
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: primaryColor,
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      )
                    ]
                  : []),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.black87,
              minimumSize: Size(size, size),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: isHovered || isSelected ? primaryColor : Colors.white38,
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}

class OnHoverButton extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  OnHoverButton({Key? key, required this.builder}) : super(key: key);

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      ..scale(1.1)
      ..translate(-2.5, -2);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          transform: transform,
          child: widget.builder(isHovered)),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
