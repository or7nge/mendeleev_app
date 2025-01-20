import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mendeleev_app/components/consts.dart';
import 'package:mendeleev_app/components/window_props.dart';
import 'package:mendeleev_app/features/model/element_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ElementDialog extends StatefulWidget {
  const ElementDialog({super.key, required this.element});
  final ElementModel element;

  @override
  State<ElementDialog> createState() => _ElementDialogState();
}

class _ElementDialogState extends State<ElementDialog> {
  late final element = widget.element;
  late final bool localeRu = AppLocalizations.of(context)!.localeName == 'ru';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth*0.8,
      height: deviceHeight*0.5,
      decoration: BoxDecoration(
        color: kGrey1,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.white,
          // color: Color(int.parse("0x${element.color}")),
          //color: Color(int.parse(element.color.substring(1), radix: 16) + 0xFF000000),
          width: 1
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     IconButton(
            //       onPressed: () => Navigator.of(context).pop(), 
            //       icon: const Icon(Icons.close, color: Colors.white,)
            //     )
            //   ],
            // ),
            Column(
              children: [
                Text(element.symbol,
                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
                ),
                Text(localeRu ? element.nameRu : element.nameEn,
                  style: const TextStyle(fontSize: 17, color: kGreen, shadows: kGreenShadow),
                  textAlign: TextAlign.center,
                ),
                // const SizedBox(height: 15,),
                // const Text("Информация",
                //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
                // ),
                const SizedBox(height: 15,),
                Text(AppLocalizations.of(context)!.standart_state,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
                ),
                Text(localeRu ? element.standardStateRu : element.standardStateEn,
                  style: const TextStyle(fontSize: 17, color: kGreen, shadows: kGreenShadow),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15,),
                Text(AppLocalizations.of(context)!.group,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
                ),
                Text(localeRu ? element.groupBlockRu : element.groupBlockEn,
                  style: const TextStyle(fontSize: 17, color: kGreen, shadows: kGreenShadow),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15,),
                Text(AppLocalizations.of(context)!.electronic_conf,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
                ),
                Text(element.electronicConfiguration,
                  style: const TextStyle(fontSize: 17, color: kGreen, shadows: kGreenShadow),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15,),
                Text(AppLocalizations.of(context)!.oxidation_states,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
                ),
                Text(element.oxidationStates,
                  style: const TextStyle(fontSize: 17, color: kGreen, shadows: kGreenShadow),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15,),
                Text(AppLocalizations.of(context)!.usage,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
                ),
                Text(localeRu ? element.usageRu : element.usageEn,
                  style: const TextStyle(fontSize: 17, color: kGreen, shadows: kGreenShadow),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15,),
                Text(AppLocalizations.of(context)!.discovery,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
                ),
                Text(localeRu ? element.discoveryRu : element.discoveryEn,
                  style: const TextStyle(fontSize: 17, color: kGreen, shadows: kGreenShadow),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15,),
                Text(AppLocalizations.of(context)!.fact,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: kGreen, shadows: kGreenShadow),
                ),
                Text(localeRu ? element.factRu : element.factEn,
                  style: const TextStyle(fontSize: 17, color: kGreen, shadows: kGreenShadow),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}