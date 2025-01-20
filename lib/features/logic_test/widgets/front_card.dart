import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mendeleev_app/components/consts.dart';
import 'package:mendeleev_app/components/window_props.dart';
import 'package:mendeleev_app/features/model/element_model.dart';

class FrontCard extends StatelessWidget {
  final VoidCallback? onTap;
  final ElementModel element;

  const FrontCard({super.key, required this.onTap, required this.element,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: deviceWidth*0.7,
        height: deviceHeight*0.3,
        decoration: BoxDecoration(
          color: kGrey1,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            //color: Color(int.parse(element.color.substring(1), radix: 16) + 0xFF000000),
            width: 1
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              //color: Color(int.parse(element.color.substring(1), radix: 16) + 0xFF000000),
              blurRadius: 10
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(element.symbol,
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
            ),
          ],
        ),
      ),
    );
  }
}