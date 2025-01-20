import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mendeleev_app/components/consts.dart';
import 'package:mendeleev_app/components/window_props.dart';
import 'package:mendeleev_app/features/model/element_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BackCard extends StatelessWidget {
  final ElementModel element;

  const BackCard({super.key,required this.element});

  @override
  Widget build(BuildContext context) {
    final bool localeRu = AppLocalizations.of(context)!.localeName == 'ru';
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(-pi),
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
            Text(localeRu ? element.nameRu : element.nameEn,
              style: const TextStyle(fontSize: 34, color: kGreen, shadows: kGreenShadow),
            ),
            
          ],
        ),
      ),
    );
  }
}