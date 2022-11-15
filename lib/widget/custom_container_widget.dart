import 'package:flutter/material.dart';
import 'package:memory_game/constants/app_enum.dart';

class CustomContainerWidget extends StatelessWidget {
  final Widget child;
  final CustomContainerBorderSide borderSide;
  final double borderRadius = 100.0;

  const CustomContainerWidget(
      {Key? key, required this.child, required this.borderSide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: [
             BoxShadow(color: Colors.blue.withOpacity(0.1) , blurRadius: 1 , blurStyle: BlurStyle.solid , spreadRadius: 20) ,
             BoxShadow(color: Colors.blue.withOpacity(0.4) , blurRadius: 1 , blurStyle: BlurStyle.solid , spreadRadius: 15) ,
             BoxShadow(color: Colors.blue.withOpacity(0.7) , blurRadius: 1 , blurStyle: BlurStyle.solid , spreadRadius: 10) ,
             BoxShadow(color: Colors.blue.withOpacity(1) , blurRadius: 1 , blurStyle: BlurStyle.solid , spreadRadius: 5) ,
          ],
          borderRadius: borderSide == CustomContainerBorderSide.bottom
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(borderRadius),
                  topLeft: Radius.circular(borderRadius),
                )),
      child: Center(child: child),
    );
  }
}
