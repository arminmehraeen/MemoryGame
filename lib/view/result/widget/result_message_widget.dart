import 'package:flutter/material.dart';

class ResultMessageWidget extends StatelessWidget {
  final String title ;
  final String subtitle ;
  const ResultMessageWidget({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold ,
              color: Theme.of(context).primaryColor  , fontSize: 30),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.normal ,
              color: Theme.of(context).primaryColor, fontSize: 20),
        ),
      ],
    ) ;
  }
}
