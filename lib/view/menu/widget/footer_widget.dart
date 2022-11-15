import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  final String version;

  final String creator;

  const FooterWidget({Key? key, required this.version, required this.creator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            creator,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 13),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            version,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
