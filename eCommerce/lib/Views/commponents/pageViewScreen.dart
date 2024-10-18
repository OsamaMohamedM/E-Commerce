import 'package:flutter/material.dart';

class pageViewScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String  content;
  const pageViewScreen({
    required this.imagePath ,
    required this.title,
    required this.content,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imagePath,height: 500,),

        Text(title ,style: const TextStyle(fontSize: 30 , fontWeight: FontWeight.bold), ),
        const SizedBox(height: 30),
        Text(content,style: const TextStyle(fontSize: 15 , color: Colors.grey,)) ,
      ],
    );
  }
}
