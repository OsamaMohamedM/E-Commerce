import 'package:flutter/material.dart';

class customIndecator extends StatelessWidget {
  final bool active ;
  const customIndecator({required this.active,super.key});
  @override
  Widget build(BuildContext context) {
    return
      AnimatedContainer(
          alignment: Alignment.center,
          duration: Duration(milliseconds:250),
          decoration: BoxDecoration(
            color: active? Colors.red : Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
        width: active? 10 :5 ,
        height: active? 10 :5,
      )
    ;
  }
}
