
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mendeleev_app/components/consts.dart';
import 'package:mendeleev_app/features/list/widgets/element_dialog.dart';
import 'package:mendeleev_app/features/model/element_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ElementCard extends StatefulWidget {
  const ElementCard({super.key, required this.element});

  final ElementModel element;

  @override
  State<ElementCard> createState() => _ElementCardState();
}

class _ElementCardState extends State<ElementCard> {

  void _onTap() async {
    await showAdaptiveDialog(
      barrierDismissible: true,
      context: context, 
      builder:(context) {
        return PopScope(
          canPop: true,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Dialog(
              child: ElementDialog(element: widget.element)
            )
          )
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //final bool localeRu = AppLocalizations.of(context)!.localeName == 'ru';
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kGrey1,
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              //color: Color(int.parse(widget.element.color.substring(1), radix: 16) + 0xFF000000),
              blurRadius: 10
            )
          ],
          border: Border.all(
            color: Colors.white,
            //color: Color(int.parse(widget.element.color.substring(1), radix: 16) + 0xFF000000),
            width: 1
          )
        ),
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 15,
              child: Text(
                widget.element.atomicNumber.toString(),
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
              )
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.element.symbol,
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
                  ),
                  Text(AppLocalizations.of(context)!.localeName == 'ru' ? widget.element.nameRu : widget.element.nameEn,
                    style: const TextStyle(fontSize: 17, color: kGreen, shadows: kGreenShadow),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(widget.element.atomicMass.toString(),
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
                ),
              )
            )
          ],
        )
      ),
    );
  }
}